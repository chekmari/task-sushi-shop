//
//  Fetch Data.swift
//  SUSHUSUSHI
//
//  Created by macbook on 26.09.2023.
//

import Foundation

enum Network {
    
    enum URLs: String {
        
        case category = "https://vkus-sovet.ru/api/getMenu.php"
        case dish     = "https://vkus-sovet.ru/api/getSubMenu.php"
        
    }
    
    enum HttpMethod: String {
        
        case get  = "GET"
        case post = "POST"
        
    }
    
}



