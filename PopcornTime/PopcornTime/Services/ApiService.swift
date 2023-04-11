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
    
    
    func getRequest(query: String = "", searchKey: String, completion: @escaping (Result<[Media], Error>) -> Void){
        // url to send request
        var strURL = "\(baseUrl)\(searchKey)?api_key=\(key)"
        if searchKey == searchingKeys[2] || searchKey == searchingKeys[3]{
            strURL = "\(baseUrl)\(searchKey)?api_key=\(key)&language=en-US&page=1"
        }
        if searchKey == searchingKeys[5] {
            // transform the query
            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
            
            strURL = "\(baseUrl)\(searchKey)?api_key=\(key)&query=\(query)"
        }
        guard let url = URL(string: strURL) else {return}
        print(strURL)

        // create the session
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            // try to decode the response data you receive as json
            do{
                print(data)
                let responseResults = try JSONDecoder().decode(Results.self, from: data)
                
               
                completion(.success(responseResults.results))
                print(responseResults.results)
            }catch{
                completion(.failure(error))
                print(error)
            }
        }
        task.resume()
        
    }
    
    
}
