//
//  Utils.swift
//  Picha
//
//  Created by Edith Dande on 14/06/2023.
//

import Foundation
import SwiftyJSON

class Utils {
    
    public func loadJSONData(from : String) -> Data? {
        guard let fileURL = Bundle.main.url(forResource: from, withExtension: "json") else {
            print("Error: File not found")
            return nil
        }

        do {
            let data = try Data(contentsOf: fileURL)
            print("loading data")
            return data
        } catch {
            print("Error loading JSON data from file: \(error.localizedDescription)")
            return nil
        }
    }
    func callEndpoint(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        print("getting url")
        // Create a URL from the provided string
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        // Create a URLSessionDataTask
        print("creating task")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error")
                completion(.failure(error))
                return
            }
            
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = NSError(domain: "Invalid HTTP response", code: 0, userInfo: nil)
                print("invalid response")
                completion(.failure(error))
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    print("success")
                    completion(.success(data))
                } else {
                    print("oops")
                    let error = NSError(domain: "Empty response data", code: 0, userInfo: nil)
                    completion(.failure(error))
                }
            } else {
                print("http error")
                let error = NSError(domain: "HTTP Error", code: httpResponse.statusCode, userInfo: nil)
                completion(.failure(error))
            }
        }
        
        // Start the URLSessionDataTask
        
        task.resume()
    }

}
