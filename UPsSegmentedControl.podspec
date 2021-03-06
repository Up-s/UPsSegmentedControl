#
# Be sure to run `pod lib lint UPsSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UPsSegmentedControl'
  s.version          = '1.0.1'
  s.summary          = 'UPsSegmentedControl'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'UISegmentedControl 확장판'

  s.homepage         = 'https://github.com/Up-s/UPsSegmentedControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Up-s' => 'dldbdjq@gmail.com' }
  s.source           = { :git => 'https://github.com/Up-s/UPsSegmentedControl.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.swift_versions = '5.0'
  
  s.source_files = 'UPsSegmentedControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UPsSegmentedControl' => ['UPsSegmentedControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
