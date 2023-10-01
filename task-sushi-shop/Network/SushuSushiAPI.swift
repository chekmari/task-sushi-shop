// MARK: - SUSHUSUSHI API

import Foundation

class SushuSushiAPI {
    
    func performPOSTrequest<T: Codable>(
        with url: String,
        parameters: [String:Any] = [:],
        responseType: T.Type,
        completion: @escaping (T?, Error?) -> Void) {
            
            guard let url = URL(string: url) else { print("Неправильный URL \(url)"); return }
            
            var request = URLRequest(url: url)
            request.httpMethod = Network.HttpMethod.post.rawValue
            
            if !parameters.isEmpty {
                
                do
                {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameters)
                    request.httpBody = jsonData
                }
                catch
                {
                    completion(nil, error)
                    return
                }
                
            }
        
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { data, response, error in
                
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data {
                    
                    do
                    {
                        let decodedData = try JSONDecoder().decode(responseType, from: data)
                        completion(decodedData, error)
                    }
                    catch
                    {
                        completion(nil, error)
                    }
                    
                }
                
            }
        
            task.resume()
    }
    
}
