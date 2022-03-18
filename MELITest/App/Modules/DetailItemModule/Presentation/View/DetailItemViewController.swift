//
//  DetailItemViewController.swift
//  MELITest
//
//  Created by Julian Barco on 17/03/22.
//

import UIKit

class DetailItemViewController: UIViewController {
    
    private let interactor: DetailtemInteractor
    private let router: DetailItemRouter
    private let itemId: String
    
    @IBOutlet weak var collectionView: UICollectionView!
    typealias DataSource = UICollectionViewDiffableDataSource<DetailSection, DetailSectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<DetailSection, DetailSectionItem>
    private var dataSource: DataSource!
    
    init(interactor: DetailtemInteractor, router: DetailItemRouter, itemId: String) {
        self.interactor = interactor
        self.router = router
        self.itemId = itemId
        let nibName = String(describing: Self.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
//        MLLogger.instance.log("details view is being deallocated", level: .deallocation)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = getDataSource()
        configurateLayout()
        collectionView.dataSource = dataSource
        interactor.getDetailtItem(id: itemId)
    }
    
    @IBAction func backButton(_ sender: Any) {
        router.goBack()
    }

}

extension DetailItemViewController {
    func getDataSource() -> DataSource  {
        let cellLoadingId = String(describing: LoadingCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellLoadingId, bundle: nil), forCellWithReuseIdentifier: cellLoadingId)
        
        let cellHeaderId = String(describing: HeaderDetailCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellHeaderId, bundle: nil), forCellWithReuseIdentifier: cellHeaderId)
        
        let cellPhotoId = String(describing: PictureCollectionViewCell.self)
        collectionView.register(UINib(nibName: cellPhotoId, bundle: nil), forCellWithReuseIdentifier: cellPhotoId)
        
        let dataSource = DataSource(collectionView: self.collectionView) { collectionView, indexPath, itemIdentifier in
            
            if let item = itemIdentifier as? DetailHeaderItem {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellHeaderId, for: indexPath) as! HeaderDetailCollectionViewCell
                cell.setUI(item.viewModel)
                return cell
            }
            
            if let item = itemIdentifier as? DetailPhotoItem {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellPhotoId, for: indexPath) as! PictureCollectionViewCell
                cell.setUI(viewModel: item.viewModel)
                return cell
            }
            
            if itemIdentifier is DetailLoading {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellLoadingId, for: indexPath) as! LoadingCollectionViewCell
                return cell
            }
            
            
            return nil
        }
        return dataSource
    }
    
    func configurateLayout(){
        collectionView.collectionViewLayout =  UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, layoutEnvironment in
            if sectionIndex == 0 {
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(80)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
                return section
            } else if sectionIndex == 1 {
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.4)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.contentInsets = .init(top: 15, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
            }
            return nil
        })
    }
    
    func applySnapshot(sections: [DetailSection]) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        self.dataSource.apply(snapshot)
    }
}
