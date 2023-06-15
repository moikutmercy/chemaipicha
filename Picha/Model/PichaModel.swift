//
//  PichaModel.swift
//  Picha
//
//  Created by Edith Dande on 14/06/2023.
//

import Foundation

struct pichni: Decodable {
    let pichas: [picha]?
}
struct picha: Decodable {
    
    struct urlSmall: Decodable{
        let raw: String?
        let full: String?
        let regular: String?
        let small: String?
        let thumb: String?
        let small_s3: String?
    }
    
    let urls: urlSmall?
    let alt_description: String?
}


