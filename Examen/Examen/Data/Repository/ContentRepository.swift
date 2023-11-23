//
//  ContentRepository.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//


import Foundation

struct Api {
    /// URL de la API
    static let base: String = "https://api.api-ninjas.com/v1/covid19?country="
    
    /// Rutas para los endpoints
    struct route {
        static let country: String = "mexico"
        static let api_key : String = "&X-Api-Key=wLVPN1zV08lJYF7uXqgyPw==zVwp6TlVcAO1NLUf"
    }
    
}

protocol ContentAPIProtocol {

    func getContentList () async -> [CountryData]?
   
}

class ContentRepository: ContentAPIProtocol {
    static let shared = ContentRepository()
    
    let n_service: NetworkAPIService
    init(n_service: NetworkAPIService = NetworkAPIService.shared){
        self.n_service = n_service
    }
    
    func getContentList() async -> [CountryData]? {
            let urlString = "\(Api.base)\(Api.route.country)\(Api.route.api_key)"
            
            guard let url = URL(string: urlString) else {
                
                return nil
            }
            return await n_service.getCountry(url: url)
        }
    
}

