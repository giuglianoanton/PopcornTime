//
//  ApiService.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import Foundation

class ApiCaller{
    
    // take the value for the env var api_key
    let key = {
        if let key = ProcessInfo.processInfo.environment["api_key"]{
            return key
        }
        return "empty"
    }()
    
    // base url
    let baseUrl = "https://api.themoviedb.org/"
    
    // ApiCaller
    static let shared = ApiCaller()
    
    
    func getRequest(searchKey: String = searchingKeys[1], completion: @escaping (Result<[Media], Error>) -> Void){
        // url to send request
        guard let url = URL(string: "\(baseUrl)\(searchKey)?api_key=\(key)") else {return}

        // create the session
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            // try to decode the response data you receive as json
            do{
                let responseResults = try JSONDecoder().decode(Results.self, from: data)
                completion(.success(responseResults.results))
                print(responseResults)
            }catch{
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
}
