Pod::Spec.new do |s|
  s.name                = 'CoreDataFramework'
  s.module_name         = 'CoreDataFramework'
  s.version             = '1.0.0'
  s.homepage            = 'https://dragonflai.co'
  s.documentation_url   = 'https://dragonflai-tech.github.io/sdk.dragonflai.co/beta-index.html'
  s.license             = { :type => 'MIT', :file => 'CoreDataFramework.xcframework/LICENSE' }
  s.author              = { 'DragonflAI LTD' => 'support@dragonflai.co' }
  s.summary             = 'On-device Content Moderation.'

  s.description         = <<-DESC
                          With on-device content moderation we can help you keep nudity off your platform.
                          This means less liability for you and safer platforms for your users.
                          DESC

  s.platform            = :ios, '12.0'
  s.source              = { :http => "https://github.com/andrew481516/test-Dragon/releases/download/1.0.0/CoreDataFramework.xcframework.zip" }

  s.swift_version       = '5.0'
  s.vendored_frameworks = "CoreDataFramework.xcframework"

  s.pod_target_xcconfig       = { 'DEFINES_MODULE' => 'YES' }

  s.pod_target_xcconfig = {'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
