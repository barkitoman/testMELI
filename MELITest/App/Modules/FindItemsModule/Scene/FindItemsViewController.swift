//
//  FindItemsViewController.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import UIKit
import RxSwift
import RxCocoa

class FindItemsViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let interactor: FindItemsInteractor
    private let router: FindItemsRouter
    
    @IBOutlet weak var emptyData: FindEmptyView!
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.searchTextField.backgroundColor = .white
            searchBar.searchTextField.layer.masksToBounds = true
            searchBar.searchTextField.layer.cornerRadius = 8
            searchBar.backgroundImage = UIImage()
            searchBar.searchTextField.placeholder = "Buscar en Mercado Libre"
            searchBar.searchTextField.delegate = self
            searchBar.searchTextField.textColor = .black
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    typealias DataSource = UICollectionViewDiffableDataSource<FindSection, FindItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<FindSection, FindItem>
    private var dataSource: DataSource!
    
    init(interactor: FindItemsInteractor, router: FindItemsRouter) {
        self.interactor = interactor
        self.router = router
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rxBind()
        dataSource = getDataSource()
        collectionView.dataSource = dataSource
        configurateLayout()
        collectionView.delegate = self
    }
    
    func rxBind(){
        searchBar.delegate = self
        searchBar.searchTextField.rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .filter({ !$0.isEmpty })
            .subscribe(onNext: {[weak self] query in
                guard let self = self else { return }
                self.interactor.find(query)
            }).disposed(by: disposeBag)
            
    }
    
    
}

extension FindItemsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension FindItemsViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewEmptyData(show:false)
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        viewEmptyData(show:false)
    }
}

extension FindItemsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard dataSource.snapshot().sectionIdentifiers.count == 1 else { return }
        
        let section = dataSource.snapshot().sectionIdentifiers[0]
        guard section.items.contains(where: { $0 is FindItemApply }) else { return }
        
        if indexPath.row == section.items.count - 1 {
            interactor.nextPage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard dataSource.snapshot().sectionIdentifiers.count == 1 else { return }

        let section = dataSource.snapshot().sectionIdentifiers[0]
        guard section.items.contains(where: { $0 is FindItemApply }) else { return }

        if let selectedItem = section.items[indexPath.row] as? FindItemApply {
            view.endEditing(true)
            let id = selectedItem.viewModel.item.id
            Log.i("Search view: user selected item: \(id)")
            router.goToShowItemBy(id: id)
        }
    }
}

//MARK: DataSource
extension FindItemsViewController {
    func getDataSource() -> DataSource {
        let cellLoadingId = String(describing: LoadingCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellLoadingId, bundle: nil), forCellWithReuseIdentifier: cellLoadingId)
        let cellApplyId = String(describing: ApplyItemCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellApplyId, bundle: nil), forCellWithReuseIdentifier: cellApplyId)
        
        let dataSource = DataSource(collectionView: self.collectionView) {[weak self] collectionView, indexPath, itemIdentifier in
            guard let _ = self else { return nil }
            if itemIdentifier is FindItemLoading {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellLoadingId, for: indexPath) as! LoadingCollectionViewCell
                return cell
            }
            if let item = itemIdentifier as? FindItemApply {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellApplyId, for: indexPath) as? ApplyItemCollectionViewCell
                cell?.setCellWithViewModel(item.viewModel)
                return cell
            }
            return nil
        }
        return dataSource
    }
    
    func configurateLayout(){
        collectionView.collectionViewLayout =  UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalWidth(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            return section
            
        })
    }
    
    func applySnapshot(sections: [FindSection]) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        self.dataSource.apply(snapshot)
    }
    
    func viewEmptyData(show:Bool){
        UIView.transition(with: self.emptyData, duration: 0.3,
                          options: .showHideTransitionViews,
                          animations: {
            self.emptyData.isHidden = !show
        })
    }
    
    
    
}
