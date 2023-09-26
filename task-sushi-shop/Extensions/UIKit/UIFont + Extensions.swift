//
//  UIFont + Extensions.swift
//  SUSHUSUSHI
//
//  Created by macbook on 26.09.2023.
//

import UIKit

extension UIFont {

    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits)) else { return .boldSystemFont(ofSize: 0) }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func boldItalic() -> UIFont {
        return withTraits(traits: .traitBold)
    }

}
