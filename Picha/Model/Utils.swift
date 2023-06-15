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
}
