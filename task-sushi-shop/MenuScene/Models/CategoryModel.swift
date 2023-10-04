// MARK: - Category Model 

import Foundation

// MARK: - Category
struct Category: Codable {
    let status: Bool
    let menuList: [CategoryList]
}

// MARK: - Category List
struct CategoryList: Codable {
    let menuID, image, name: String
    let subMenuCount: Int
}
