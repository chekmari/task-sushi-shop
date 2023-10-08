import UIKit

// MARK: - Menu View Controller

class MenuViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let customNavigationView = CustomNavigationView()
    private var collectionView: UICollectionView!
    private var activityIndicator = UIActivityIndicatorView.largeSetup()
    
    // MARK: - Variables
    
    private var selectedCategoryIndex: Int = 0
    private var headerTitle: [String] = []
    
    // MARK: - Network
    
    private var facade = NetworkFacade()
    private var categoryData: [CategoryList] = []
    private var dishData: [MenuList] = []
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        view.backgroundColor = Resources.SetColor.mineShaft()
        view.addView(customNavigationView)
        view.addView(activityIndicator)
        view.addView(collectionView)
        setConstraints()
        
        loadCategory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    // MARK: - Setup Collection View
    
    private func setupCollectionView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = Resources.SetColor.mineShaft()
        collectionView.isScrollEnabled = true
        collectionView.isHidden        = true
        
        collectionView.register(                            CategoryCell.self,
                                        forCellWithReuseIdentifier: CategoryCell.idCategoryCell)
        collectionView.register(                            SubMenuCell.self,
                                        forCellWithReuseIdentifier: SubMenuCell.idSubMenuCell)
        collectionView.register(                            CategoryHeader.self,
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier:        CategoryHeader.headerId)
        
        collectionView.dataSource = self
        collectionView.delegate   = self
    }
    
}

//MARK: - UI Collection View

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func selectFirstCategory() {
        
        if selectedCategoryIndex == 0 && categoryData.count > 0 {
            
            let indexPath = IndexPath(item: 0, section: 0)
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
            collectionView(collectionView, didSelectItemAt: indexPath)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        
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
    
    func collectionView(_ collectionView: UICollectionView, 
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0 :  return categoryData.count
        case 1 :  return dishData.count
        default:  return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 
        {
            let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.idCategoryCell,
            for: indexPath) as!  CategoryCell
            
            let category = categoryData[indexPath.item]
            
            cell.configure( name:  category.name,
                           count:  category.subMenuCount,
                           image:  category.image)
            
            return cell
    
        } else {
            
            let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SubMenuCell.idSubMenuCell,
            for: indexPath) as!  SubMenuCell
                
            let dish = dishData[indexPath.item]
        
            cell.configure(       name: dish.name,
                           сomposition: dish.content,
                                  cost: dish.price,
                                weight: dish.weight,
                                 spicy: dish.spicy,
                                 image: dish.image)
            
                
                
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        didSelectItemAt indexPath: IndexPath) {
        
        
        if indexPath.section == 0 {
            
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
                
                
                let id = categoryData[indexPath.item].menuID
                DispatchQueue.global(qos: .background).async { self.loadSubMenu(for: id) }
                
            }
            
            
            
        } else if indexPath.section == 1 {
            
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            
            
            
        } else if indexPath.section == 1 {
            
            
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
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(customNavigationView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
    
        let spacing: CGFloat = 4
        let spacing2: CGFloat = 20

        /// - Констрейнты для 1 секции
        
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
            sectionIndex == 0 ? section1 : section2
        }
        
        return layout
    }
    
    
}

// MARK: - SushuSushi API

extension MenuViewController {
    
    /// - Load Category
    
    private func loadCategory() {
        
        activityIndicator.startAnimating()
        
        facade.getCategory { categoryData, error in
            
            if let category = categoryData {
                if category.status { self.categoryData = category.menuList }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.collectionView.isHidden = false
                    self.collectionView.reloadData()
                    self.selectFirstCategory()
                }
                
            } else if let error = error {
                
                print("Ошибка при загрузке категорий: \(error.localizedDescription)")
                self.collectionView.isHidden = true
                self.activityIndicator.startAnimating()
                self.collectionView.reloadData()
                
            }
            
        }
        
        
    }
    
    /// - Load Sub Menu
    
    private func loadSubMenu(for id: String) {
        
        facade.getDish(for: id) { dishData, error in
            
            if let dish = dishData {
                
                DispatchQueue.main.async {
                    if dish.status { self.dishData = dish.menuList }
                    self.collectionView.reloadData()
                }
                
            } else if let error = error {
                
                print("Ошибка при загрузке категорий: \(error.localizedDescription)")
                
            }
        }
    }
    
}
