Pod::Spec.new do |s|
  s.name             = 'EZConstraints'
  s.version          = '1.1.1'
  s.summary          = 'Auto Layout but a lot EZier.'
  s.description      = <<-DESC
  EZConstraints is an easier and more descriptive way to write auto layout constraints.
                       DESC
  s.homepage         = 'https://github.com/MohamedShiha/EZConstraints'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohamed Shiha' => 'mohamedshiha15@gmail.com' }
  s.source           = { :git => 'https://github.com/MohamedShiha/EZConstraints.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/shiha_eg'
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.swift_version = '5.0'
  s.ios.source_files = 'Source/iOS/*.swift'
  s.ios.frameworks = 'UIKit'
end
