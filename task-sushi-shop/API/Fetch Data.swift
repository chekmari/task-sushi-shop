//
//  Fetch Data.swift
//  SUSHUSUSHI
//
//  Created by macbook on 26.09.2023.
//

import Foundation

class API {
    
    // Метод для выполнения POST-запроса
    func postData<T: Codable>(url: URL, data: Data?, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let emptyDataError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty Data"])
                completion(.failure(emptyDataError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}


protocol Facade {

    
}

let postData: String = ""
let postURLCategory = URL(string: "https://vkus-sovet.ru/api/getMenu.php")!
let postURLSubMenu = URL(string: "https://vkus-sovet.ru/api/getMenu.php?menuID=\(postData)")


func postData<T: Codable>(url: URL, data: Data?, completion: @escaping (Result<T, Error>) -> Void) {
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = data
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data else {
            let emptyDataError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty Data"])
            completion(.failure(emptyDataError))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
    
    task.resume()
}
