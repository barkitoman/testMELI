platform :ios, '13.0'
inhibit_all_warnings!

def development_pods
  pod 'NVActivityIndicatorView'
  pod 'RxSwift'
  pod 'RxCocoa'
end

def test_pods
    pod "SwiftyMocky"
end

target 'MELITest' do
  use_frameworks!
  
  target 'MELITestTests' do
    inherit! :search_paths
    development_pods
    # Pods for testing
  end

  target 'MELITestUITests' do
    # Pods for testing
    test_pods
  end
  
end
