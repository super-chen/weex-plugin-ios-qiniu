#
#  Be sure to run `pod spec lint QBMDatePickerPlugin.podspec' to ensure this is a

Pod::Spec.new do |s|



  s.name         = "weex-plugin-ios-qiniu"
  s.version      = "0.1.0"
  s.summary      = "weex-plugin-ios-qiniu File"

  s.description  = <<-DESC
                  weex-plugin-ios-qiniu 封装七牛SDK以支持Weex框架直接调用
                   DESC

  s.homepage     = 'https://github.com/super-chen/weex-plugin-ios-qiniu'

  s.license      = "MIT"

  s.author       = { "Frank Chen" => "superchen@live.cn" }

  s.platform     = :ios

  s.ios.deployment_target = "8.0"

  s.source       = { :git => 'https://github.com/super-chen/weex-plugin-ios-qiniu.git', :tag => s.version }

  s.source_files = "Classes/*.{h,m}"

  s.requires_arc = true
end
