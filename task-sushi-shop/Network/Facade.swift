// MARK: -

import Foundation

struct ID {
    
    let idMenu: String
    
}

// MARK: - Network Facade Protocol

protocol NetworkFacadeProtocol {
    
    func getCategory(completion: @escaping (Category?, Error?) -> Void)
    func getDish(for idMenu: String, completion: @escaping ([String]?, Error?) -> Void)
    
}

// MARK: - Network Facade

class NetworkFacade: NetworkFacadeProtocol {
    
    let sushusushiAPI = SushuSushiAPI()
    
    func getCategory(completion: @escaping (Category?, Error?) -> Void) {
        
        sushusushiAPI.performPOSTrequest(
            with: Network.URLs.category.rawValue,
            responseType: Category.self
        )
        {   (categories, error) in
            if let categories = categories { completion(categories, nil) } else
            if let      error = error      { completion(nil, error     ) }
        }
        
    }
        
        func getDish(for idMenu: String, completion: @escaping ([String]?, Error?) -> Void) {
            let parameters = ["menuID": idMenu]
            
            sushusushiAPI.performPOSTrequest(
                with: Network.URLs.dish.rawValue,
                parameters: parameters,
                responseType: [String].self
            )
            {   (dishes, error) in
                if let dishes = dishes { completion(dishes, nil) } else
                if let  error = error  { completion(nil,  error) }
            }
            
        }
    
    
}

