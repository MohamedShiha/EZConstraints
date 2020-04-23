Pod::Spec.new do |s|
  s.name             = 'EZConstraints'
  s.version          = '0.1.0'
  s.summary          = 'A short description of EZConstraints.'
  s.description      = <<-DESC
EZConstraints is an easier and more descriptive way to write auto layout constraints
                       DESC
  s.homepage         = 'https://github.com/MohamedShiha/EZConstraints'
  # s.screenshots     = '', ''
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohamed Shiha' => 'mohamedshiha15@gmail.com' }
  s.source           = { :git => 'https://github.com/MohamedShiha/EZConstraints.git', :tag => s.version.to_s }
   s.social_media_url = 'https://twitter.com/shiha_eg'

  s.ios.deployment_target = '8.0'
  s.swift.version = '5.0'
  s.source_files = 'EZConstraints/Source/**/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
end
