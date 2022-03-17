def test_pods
    pod "SwiftyMocky"
end

target 'MELITest' do

  use_frameworks!
  
  pod 'NVActivityIndicatorView'
  pod 'RxSwift'
  pod 'RxCocoa'
  
  target 'MELITestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MELITestUITests' do
    # Pods for testing
    test_pods
  end
  
end
