def test_pods
    pod "SwiftyMocky"
    pod 'RxBlocking'
    pod 'RxTest'
end

target 'MELITest' do

  use_frameworks!
  
  pod 'NVActivityIndicatorView'
  pod 'RxSwift'
  pod 'RxCocoa'
  
  target 'MELITestTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end

  target 'MELITestUITests' do
    # Pods for testing

  end
  
end
