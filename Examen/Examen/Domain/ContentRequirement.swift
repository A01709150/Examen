//
//  ContentRequirement.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//

import Foundation

protocol ContentRequirementProtocol{
    func getContentList() async -> [CountryData]?
}

class ContentRequirement: ContentRequirementProtocol{
    static let shared = ContentRequirement()
    let dataRepository: ContentRepository
    

    init(dataRepository: ContentRepository = ContentRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getContentList() async -> [CountryData]? {
            print("Obteniendo lista de contenido desde ContentRequirement")
            return await dataRepository.getContentList()
        }

}
