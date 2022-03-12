# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'R.swift'
end

target 'TMDBClient' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
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
