import UIKit

public protocol AdapterDelegate: class {
    
    /// Apply model to view
    func configure(model: Any, view: UIView, indexPath: IndexPath)
    
    /// Handle view selection
    func select(model: Any)
    
    /// Size the view
    func size(model: Any, containerSize: CGSize) -> CGSize?
}


open class Adapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public var sections: [Section] = []
    public weak var collectionView: UICollectionView?
    public weak var delegate: AdapterDelegate?
    
    let registryService = RegistryService()

    // MARK: - Initialize
    public required init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, 
                             numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: item.cellType.typeName,
            for: indexPath)
        
        delegate?.configure(model: item.model, view: cell, indexPath: indexPath)
        
        return cell
    }
    
    open func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let header = sections[indexPath.section].header,
               kind == UICollectionView.elementKindSectionHeader {
            
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: header.viewType.typeName,
                for: indexPath)
            
            delegate?.configure(model: header.model, view: view, indexPath: indexPath)
            return view
            
        } else if let footer = sections[indexPath.section].footer,
                      kind == UICollectionView.elementKindSectionFooter {
            
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: footer.viewType.typeName,
                for: indexPath)
            
            
            delegate?.configure(model: footer.model, view: view, indexPath: indexPath)
            return view
            
        } else {
            
            let view = DummyReusableView()
            view.isHidden = true
            return view
            
        }

    }
    
    // MARK: - UICollectionViewDelegate
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = sections[indexPath.section].items[indexPath.row]
        
        delegate?.select(model: item.model)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    open func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      sizeForItemAt indexPath: IndexPath) -> CGSize {

      let item = sections[indexPath.section].items[indexPath.row]
          
      if let size = delegate?.size(model: item.model, containerSize: collectionView.frame.size) {
        return size
      }

      if let size = (collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize {
        return size
      }

      return collectionView.frame.size
    }

    open func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      referenceSizeForHeaderInSection section: Int) -> CGSize {

      guard let header = sections[section].header else {
        return .zero
      }

      guard let size = delegate?.size(model: header.model, containerSize: collectionView.frame.size) else {
        return .zero
      }

      return size
    }

    open func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      referenceSizeForFooterInSection section: Int) -> CGSize {

      guard let footer = sections[section].footer else {
        return .zero
      }

      guard let size = delegate?.size(model: footer.model, containerSize: collectionView.frame.size) else {
        return .zero
      }

      return size
    }

    // MARK: - Reload

    open func reload(sections: [Section]) {
      // Registry
      registryService.registerIfNeeded(
        collectionView: collectionView,
        sections: sections
      )

      self.sections = sections
      collectionView?.reloadData()
    }
    
}
                    

