#
# Be sure to run `pod lib lint XZMathEditor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XZMathEditor'
  s.version          = '1.0.2'
  s.summary          = 'MathEditor.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xiaoMing0109/XZMathEditor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HotIcecream' => 'liuming_0109@163.com' }
  s.source           = { :git => 'https://github.com/xiaoMing0109/XZMathEditor.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'XZMathEditor/Classes/**/*'
  
  s.private_header_files = 'XZMathEditor/Classes/internal/**/*.h'
  
  s.resource_bundles = {
    'MTKeyboardResources' => ['XZMathEditor/Assets/**/*']
  }

  s.frameworks = 'UIKit'
  
  s.dependency 'iosMath', '~> 0.9.3'
  
end
