//
//  ContentViewModel.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//

import Foundation

//class ContentViewModel: ObservableObject { // Emite cambios de sus valores
//    @Published var contentList = [????]() // Notifica cambios al ContentView
//    
//    var ContentListRequirement: ContentRequirementProtocol
//
//    init(ContentListRequirement: ContentRequirementProtocol = ContentRequirement.shared) {
//        self.ContentListRequirement = ContentListRequirement
//        
//    }
//
//    @MainActor // Singleton del OS para que un método corra en el mainQueue
//    func getContentList() async {
//        if let result = await ContentListRequirement.getContentList() {
//                for caseData in result.cases {
//                    let con = ???(date: caseData.date, total: caseData.total, new: caseData.new)
//                    self.contentList.append(con)
//                    print(contentList)
//                }
//                
//               
//            } else {
//                // Handle the nil case, perhaps by showing an error message to the user
//            }
//    }
//}

class ContentViewModel: ObservableObject {
    @Published var contentList = [CaseData]() // Lista para almacenar los datos de casos

    var ContentListRequirement: ContentRequirementProtocol

    init(ContentListRequirement: ContentRequirementProtocol = ContentRequirement.shared) {
        self.ContentListRequirement = ContentListRequirement
    }

    @MainActor
    func getContentList() async {
        if let result = await ContentListRequirement.getContentList() {
            // Convertir el diccionario de casos en una lista de CaseData
            self.contentList = result.flatMap { countryData in
                        countryData.cases.map { $0.value }
                    }
                    print("Lista de casos procesados: \(self.contentList)")
                } else {
                    print("No se recibieron datos o hubo un error en la solicitud")
        }
    }
}

