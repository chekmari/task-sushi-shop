// MARK: - SUSHUSUSHI API

import Foundation

class SushuSushiAPI {
    
    func performPOSTrequest<T: Codable>(
        with url: String,
        parameters: [String:String] = [:],
        responseType: T.Type,
        completion: @escaping (T?, Error?) -> Void) {
            
            var components = URLComponents(string: url)
            components?.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
            
            guard let url = components?.url else { print("Неправильный URL \(url)"); return }
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = Network.HttpMethod.POST.rawValue
        
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
                        print("Ошибка при декодировании JSON: \(error.localizedDescription)")
                        completion(nil, error)
                    }
                    
                }
                
            }
        
            task.resume()
    }
    
}
