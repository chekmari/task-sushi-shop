//
//  MenuViewController.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    let customNavigationView = CustomNavigationView()
    private var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        categoryCollectionView.backgroundColor = Resources.SetColor.mineShaft()
        categoryCollectionView.isScrollEnabled = true
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        categoryCollectionView.register(CategoryCell.self,
                                        forCellWithReuseIdentifier: CategoryCell.idCategoryCell)
        categoryCollectionView.register(SubMenuCell.self, 
                                        forCellWithReuseIdentifier: SubMenuCell.idSubMenuCell)
        categoryCollectionView.register(CategoryHeader.self,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier:        CategoryHeader.headerId)
        
        view.backgroundColor = Resources.SetColor.mineShaft()
        view.addView(customNavigationView)
        view.addView(categoryCollectionView)
        setConstraints()

    }
    
}

//MARK: - UI Collection View

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 1 
        {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: CategoryHeader.headerId,
                for: indexPath) as!  CategoryHeader
            


            return header
            
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 
        {
            let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.idCategoryCell,
            for: indexPath) as!  CategoryCell
            
            
            // cell.configure(value: <#T##String#>, count: <#T##String#>, imageURL: <#T##URL?#>)
        
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SubMenuCell.idSubMenuCell,
            for: indexPath) as!  SubMenuCell
                
            
                
                
                
            return cell
        }
        
    }
    
}


// MARK: Set Constraints

extension MenuViewController {
    
    private func setConstraints() {
        
        customNavigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
            
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(customNavigationView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        /// - Констрейнты для 1 секции
        let spacing: CGFloat = 4
        let spacing2: CGFloat = 20

        let itemSize1 = NSCollectionLayoutSize(
            widthDimension: .absolute(140),
            heightDimension: .absolute(130)
        )
        let item1 = NSCollectionLayoutItem(layoutSize: itemSize1)

        let groupSize1 = NSCollectionLayoutSize(
            widthDimension: .absolute(140),
            heightDimension: .absolute(130)
        )

        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize1, subitem: item1, count: 1)
        group1.interItemSpacing = .fixed(spacing)

        let section1 = NSCollectionLayoutSection(group: group1)
        section1.contentInsets = .init(top: spacing, leading: spacing2, bottom: spacing, trailing: spacing)
        section1.interGroupSpacing = 10
        section1.orthogonalScrollingBehavior = .continuous

        /// - Констрейнты для 2 секции
        
        let headerSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        
        let header2 = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize2,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
        
        
        let itemSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize2)

        let groupSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(270)
        )

        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize2, subitem: item2, count: 2)
        group2.interItemSpacing = .fixed(spacing2)

        let section2 = NSCollectionLayoutSection(group: group2)
        section2.contentInsets = .init(top: spacing2, leading: spacing2, bottom: spacing2, trailing: spacing2)
        
        section2.interGroupSpacing = spacing2
        
        section2.boundarySupplementaryItems = [header2]
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return section1
            } else {
                return section2
            }
        }
        

        return layout
    }
    
    
}
