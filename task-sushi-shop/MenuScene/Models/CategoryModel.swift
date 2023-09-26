// MARK: - Category Model 

import Foundation

// MARK: - Category
struct Category: Codable {
    let status: Bool
    let menuList: [CategoryList]
}

// MARK: - MenuList
struct CategoryList: Codable {
    let menuID, image, name: String
    let subMenuCount: Int
}
