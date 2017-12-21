Pod::Spec.new do |s|
  s.name             = "Omnia"
  s.summary          = "Everything your projects need to know"
  s.version          = "3.0.0"
  s.homepage         = "https://github.com/onmyway133/Omnia"
  s.license          = 'MIT'
  s.author           = { "Khoa Pham" => "onmyway133@gmail.com" }
  s.source           = {
    :git => "https://github.com/onmyway133/Omnia.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/onmyway133'

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = "3.0"

  s.requires_arc = true
  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  s.tvos.source_files = 'Sources/{iOS,tvOS,Shared}/**/*'
  s.osx.source_files = 'Sources/{macOS,Shared}/**/*'
  s.watchos.source_files = 'Sources/{watchOS,Shared}/**/*'

  s.ios.frameworks = 'UIKit', 'Foundation'
  s.osx.frameworks = 'Cocoa', 'Foundation'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
