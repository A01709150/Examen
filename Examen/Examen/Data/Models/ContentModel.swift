//
//  ContentModel.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//

import Foundation

struct CountryData: Codable {
    var country: String
    var region: String
    var cases: [String: CaseData]
}

struct CaseData: Codable, Hashable {
    var total: Int
    var new: Int
}


