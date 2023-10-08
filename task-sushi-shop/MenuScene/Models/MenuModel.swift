// MARK: - Menu Model

import Foundation

// MARK: - Menu
struct Dish: Codable {
    let status: Bool
    let menuList: [MenuList]
}

// MARK: - MenuList
struct MenuList: Codable {
    let id, image, name, content, price: String
    let weight, spicy: String?
}
