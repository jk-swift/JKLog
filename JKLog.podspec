#
# Be sure to run `pod lib lint JKLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JKLog'
  s.version          = '0.1.1'
  s.summary          = 'A short description of JKLog.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'JKLog is base on alog'

  s.homepage         = 'https://github.com/jk-swift/JKLog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yulongmailbox@163.com' => 'yulongmailbox@163.com' }
  s.source           = { :git => 'https://github.com/jk-swift/JKLog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JKLog/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JKLog' => ['JKLog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.libraries = "c++", "z"

  s.vendored_libraries = "JKLog/Classes/lib/*.a"

  s.xcconfig = { "ENABLE_BITCODE" => "NO" }

  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

end
