# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'R.swift'
  pod 'SwiftLint'
end

target 'TMDBClient' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  common_pods
  # Pods for TMDBClient
  
  target 'TMDBClientTests' do
    inherit! :search_paths
    # Pods for testing
    common_pods
  end
  
  target 'TMDBClientUITests' do
    # Pods for testing
    common_pods
  end
  
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
  end
 end
end
