
Pod::Spec.new do |s|

  s.name                  = "SwpGuidancePage"
  s.version               = "1.1.0"
  s.ios.deployment_target = '7.0'
  s.summary               = " 封装 App 引导页 "
  s.homepage              = "https://github.com/swp-song/SwpGuidancePage"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpGuidancePage.git", :tag => s.version }
  s.source_files          = "SwpGuidancePage/**/*.{h,m}"
  s.requires_arc          = true
  s.framework             = "UIKit", "Foundation"

end
