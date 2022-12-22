#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint finicity.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'finicity'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin for Finicity SDK'
  s.description      = <<-DESC
A new Flutter plugin for Finicity SDK
                       DESC
  s.homepage         = 'https://github.com/gvsakhil/finicity'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gvs Akhil' => 'gvsakhil@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'FinicityConnect'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
