//
//  CoreDataManager.swift
//  CoreDataFramework
//
//  Created by Volodymyr Nazarkevych on 04.05.2022.
//

import Foundation
import CoreData

public class CoreDataManager {
    public static let shared = CoreDataManager()

//    let identifier: String  = "com.k.CoreDataFramework"
    let model: String = "CoreDataFramework"

    lazy var persistentContainer: NSPersistentContainer = {
        
        let messageKitBundle = Bundle(for: Self.self)
        let modelURL = messageKitBundle.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)

        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in

            if let err = error{
                fatalError("❌ Loading of store failed:\(err)")
            }
        }

        return container
    }()

    public func createMetric(features: [String], duration: Double, version: String, productId: Int) {
        let context = persistentContainer.viewContext
        let contact = NSEntityDescription.insertNewObject(forEntityName: "Metric", into: context) as! Metric
        
        contact.calculationTime = Float(duration)
        contact.features = features
        contact.instance = Int64(productId)
        contact.timestamp = Int64(NSDate().timeIntervalSince1970)
        contact.version = version

        do {
            try context.save()
        } catch let error {
            
        }
    }

    public func fetch() -> [Metric] {

        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Metric>(entityName: "Metric")

        do {

            let Metric = try context.fetch(fetchRequest)
            print("Success to fetch Metric")

            
            return Metric
            
        } catch let fetchErr {
            print("❌ Failed to fetch Metric:",fetchErr)
            return [Metric]()
        }
    }

    public func deleteAllData() {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Metric>(entityName: "Metric")
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let metrics = try context.fetch(fetchRequest)

            for metric in metrics {
                context.delete(metric)
            }

            // Save Changes
            try context.save()

        } catch {
            // Error Handling
            // ...
        }
    }
}

