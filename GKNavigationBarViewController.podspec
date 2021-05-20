Pod::Spec.new do |s|
  s.name                    = "GKNavigationBarViewController"
  s.version                 = "3.0.2"
  s.summary                 = "自定义导航栏--导航栏联动"
  s.homepage                = "https://github.com/QuintGao/GKNavigationBarViewController"
  s.license                 = "MIT"
  s.authors                 = { "QuintGao" => "1094887059@qq.com" }
  s.social_media_url        = "https://github.com/QuintGao"
  s.platform                = :ios, "9.0"
  s.ios.deployment_target   = "9.0"
  s.source                  = { :git => "https://github.com/QuintGao/GKNavigationBarViewController.git", :tag => s.version.to_s }
  s.source_files            = "GKNavigationBarViewController/**/*.{h,m}"
  s.public_header_files     = "GKNavigationBarViewController/**/*.h"
  s.resource                = "GKNavigationBarViewController/GKNavigationBarViewController.bundle"
  s.frameworks              = "Foundation", "UIKit"
end

















