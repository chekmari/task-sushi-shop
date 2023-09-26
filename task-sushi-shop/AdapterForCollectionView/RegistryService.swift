import UIKit

class RegistryService {
  private var registeredTypes = Set<String>()

  func registerIfNeeded(collectionView: UICollectionView?, sections: [Section]) {
    sections.forEach { section in
      if let header = section.header, !registeredTypes.contains(header.viewType.typeName) {

        if header.viewType.isSubclass(of: UICollectionReusableView.self) {
          collectionView?.register(
            header.viewType,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: header.viewType.typeName
          )
        }

        registeredTypes.insert(header.viewType.typeName)
      }

      if let footer = section.footer, !registeredTypes.contains(footer.viewType.typeName) {
        if footer.viewType.isSubclass(of: UICollectionReusableView.self) {
          collectionView?.register(
            footer.viewType,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: footer.viewType.typeName
          )
        }

        registeredTypes.insert(footer.viewType.typeName)
      }

      section.items.forEach { item in
        if !registeredTypes.contains(item.cellType.typeName) {

          if item.cellType.isSubclass(of: UICollectionViewCell.self) {
            collectionView?.register(
              item.cellType,
              forCellWithReuseIdentifier: item.cellType.typeName
            )
          }

          registeredTypes.insert(item.cellType.typeName)
        }
      }
    }
  }
}
