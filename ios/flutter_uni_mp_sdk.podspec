#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_uni_mp_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_uni_mp_sdk'
  s.version          = '0.0.1'
  s.summary          = 'uniapp 小程序sdk插件'
  s.description      = <<-DESC
uniapp 小程序sdk插件
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'
  s.static_framework = true
  s.vendored_frameworks = 'UniMPSDK/Core/*.framework'

  # 系统framework库
  s.frameworks = 'JavaScriptCore', 'CoreMedia', 'MediaPlayer', 'AVFoundation', 'AVKit',
  'AVKit', 'OpenGLES', 'CoreText', 'CoreLocation',
  'ImageIO', 'CoreMedia', 'CoreMotion', 'QuartzCore', 'CoreGraphics',
  'QuickLook', 'CoreTelephony', 'MobileCoreServices', 'AdSupport'
  # 系统C库              
  s.libraries = "libc++","libiconv"

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 arm64' }
  s.swift_version = '5.0'
end
