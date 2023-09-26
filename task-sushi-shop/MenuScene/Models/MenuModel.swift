// MARK: - Menu Model

import Foundation

// MARK: - Menu
struct Menu: Codable {
    let status: Bool
    let menuList: [MenuList]
}

// MARK: - MenuList
struct MenuList: Codable {
    let id, image, name, content, price, weight: String
    let spicy: String?
}
