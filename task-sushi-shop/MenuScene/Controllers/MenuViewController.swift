//
//  MenuViewController.swift
//  task-sushi-shop
//
//  Created by macbook on 22.09.2023.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "CategoryHeader",
                for: indexPath) as! CategoryHeader
            // Настройте хедер для второй секции здесь
            // Например, установите текст заголовка, изображение и т.д.
            return header
        } else {
            
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell",
                                                              for: indexPath) as! CategoryCell
                // Настройте ячейку для первой секции с использованием данных из dataForSection1
                cell.configure(value: "Суши", image: Resources.setImage.logo()!, count: "4")
                cell.layer.cornerRadius = 8
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SubMenuCell
                // Настройте ячейку для второй секции с использованием данных из dataForSection2
                cell.backgroundColor = .white
                cell.layer.cornerRadius = 8
                
                return cell
            }
        
    }
    
    
    let customNavigationView = CustomNavigationView()
    
    private var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Resources.SetColor.mineShaft()
        
        setupCustomNavigationView()
        
        
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        categoryCollectionView.backgroundColor = Resources.SetColor.mineShaft()
        
        categoryCollectionView.isScrollEnabled = true
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        categoryCollectionView.register(SubMenuCell.self, forCellWithReuseIdentifier: "cell")
        categoryCollectionView.register(CategoryHeader.self,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: "CategoryHeader")
        
        view.addView(categoryCollectionView)
        
        
        categoryCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(customNavigationView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        // MARK: - Констрейнты для 1 секции
        
        let spacing: CGFloat = 4
        let spacing2: CGFloat = 20

        // Констрейнты для первой секции
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

        // MARK: - Констрейнты для 2 секции
        
        
        let itemSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item2 = NSCollectionLayoutItem(layoutSize: itemSize2)

        let groupSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(260)
        )

        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize2, subitem: item2, count: 2) // Настройте количество элементов в ряду (count) по вашему желанию
        group2.interItemSpacing = .fixed(spacing2)

        let section2 = NSCollectionLayoutSection(group: group2)
        section2.contentInsets = .init(top: spacing2, leading: spacing2, bottom: spacing2, trailing: spacing2)
        section2.interGroupSpacing = spacing2
        

        // Настройки хедера для второй секции (если он есть)
        let headerSize2 = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20) // Здесь можно настроить высоту хедера
        )
        let header2 = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize2,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    
        section2.boundarySupplementaryItems = [header2]
        
        // Создание композиционной компоновки
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return section1 // Возвращаем первую секцию для первой секции
            } else {
                return section2 // Возвращаем вторую секцию для второй секции
            }
        }

        return layout
    }

    
    private func setupCustomNavigationView() {
        
        view.addView(customNavigationView)
        customNavigationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
            
        }
        
    }
    

}


extension MenuViewController {
    
    func configure(model: Any, view: UIView, indexPath: IndexPath) {
        
        
    }
    
    func select(model: Any) {
        
    }
    
    func size(model: Any, containerSize: CGSize) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
