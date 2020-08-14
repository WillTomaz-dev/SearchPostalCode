//
//  PostalCode.swift
//  SearchPostalCode
//
//  Created by William Tomaz on 17/06/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation

struct PostalCode: Codable {
    var cep: String
    var logradouro: String
    var complemento: String
    var bairro: String
    var localidade: String
    var uf: String
}
