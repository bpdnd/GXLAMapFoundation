#
# Be sure to run `pod lib lint GXLAMapFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GXLAMapFoundation'
  s.version          = '0.1.1'
  s.summary          = 'GXLAMapFoundation.'
  s.swift_version    =  '5'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
GXLAMapFoundation 高德地图基础
                       DESC

  s.homepage         = 'https://github.com/bpdnd/GXLAMapFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bpdnd' => '3438291751@qq.com' }
  s.source           = { :git => 'https://github.com/bpdnd/GXLAMapFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  
  s.source_files = 'GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/*.framework/Headers/**.h',
  s.public_header_files = 'GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/*.framework/Headers/**.h'
  s.frameworks = 'UIKit', 'SystemConfiguration','CoreTelephony','Security','GLKit'
  s.libraries  = 'c++'
  s.dependency 'GZIP'
  s.vendored_frameworks =  'GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/*.framework'
  s.preserve_paths = 'GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/*.framework'
  s.pod_target_xcconfig = {
            'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/*.framework/Headers',
            'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/',
            'OTHER_LDFLAGS' => '-ObjC'
  }
  
  s.prepare_command = <<-EOF
    # 创建Base Module
    rm -rf GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules
    mkdir GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules
    touch GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapFoundation/Vendors/AMapFoundation-NO-IDFA/AMapFoundationKit.framework/Modules/module.modulemap
    framework module AMapFoundationKit {
      umbrella header "AMapFoundationKit.h"
      export *
    }
    \EOF
  EOF
  
  
  # s.resource_bundles = {
  #   'GXLAMapFoundation' => ['GXLAMapFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
