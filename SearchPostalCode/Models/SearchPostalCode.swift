//
//  SearchPostalCode.swift
//  SearchPostalCode
//
//  Created by William Tomaz on 17/06/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation
import Alamofire



class SearchPostalCode {
    static private let basePath = "https://viacep.com.br/ws/"
    
    class func loadAdress(postalCode: String, onComplete: @escaping (PostalCode?) -> Void) {
        let url = getPostalCode(postalCode: postalCode)
        Alamofire.request(url).responseJSON{ (response) in
            guard let data = response.data, let postalCode = try? JSONDecoder().decode(PostalCode.self, from: data) else {
                onComplete(nil)
                return
            }
            onComplete(postalCode)
        }
    }
    
    class func getPostalCode(postalCode: String) -> String {
        let basePath = "\(self.basePath)\(postalCode)/json/"
        return basePath
 
    }
}

