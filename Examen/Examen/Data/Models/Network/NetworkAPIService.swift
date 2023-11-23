//
//  NetworkAPIService.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//

import Foundation
import Alamofire
class NetworkAPIService {
 
    // Singleton: Proporciona un único acceso a la instancia de un objeto
    static let shared = NetworkAPIService()
    
    // Obtener respuesta de la API
    func getCountry(url: URL) async -> [CountryData]? {
            print("Realizando solicitud a: \(url.absoluteString)")
            
            let task_request = AF.request(url, method: .get).validate()
            
            let response = await task_request.serializingData().response
            
            switch response.result {
            case let .success(data):
                do {
                    
                    return try JSONDecoder().decode([CountryData].self, from: data)
                } catch {
                    
                    return nil
                }
            case let .failure(error):
                print("Error en la solicitud: \(error.localizedDescription)")
                return nil
            }
        }
    
}
