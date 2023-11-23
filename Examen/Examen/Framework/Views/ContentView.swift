//
//  ContentView.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//


import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()

    private let barMaxWidth: CGFloat = 230 // Máximo ancho para las barras
    private let startDate = Calendar.current.date(from: DateComponents(year: 2020, month: 1, day: 22)) ?? Date()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("OMS")
                        .padding(.vertical)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Divider()

                    Text("  Es de suma importancia comprender las tendencias y los días del año que el COVID-19 se propaga más para saber cómo lidiar con él.")
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    
                    Text("Casos nuevos de COVID19")
                        .padding(.vertical)
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Divider()
                    
                    Text("Indicadores:").padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    Text("-   Rojo indica que hubieron una gran cantidad de nuevos casos, es necesario anazlizar porque en ese dia hubieron tantos casos.").padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    Text("-   Amarillo indica que hubo una cantidad moderada de nuevos casos").padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                
                    Text("-   Azul indico que no ocurrieron muchos casos nuevos.").padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    

                    Divider()

                    ForEach(Array(contentViewModel.contentList.enumerated()), id: \.element) { index, caseData in
                        HStack {
                            Text(dateString(forIndex: index))
                                .font(.caption)
                                .frame(width: 100)
                            Rectangle()
                                .fill(barColor(for: caseData.new))
                                .frame(width: max(min(CGFloat(max(caseData.new, 0)) / 100, barMaxWidth), 0), height: 20)
                            Text("\(caseData.new)")
                                .font(.caption)
                                .frame(width: 75)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding([.leading, .trailing]) // Ajusta el padding lateral para todo el VStack
            }
        }
        .onAppear {
            Task {
                await contentViewModel.getContentList()
            }
        }
    }

    private func barColor(for newCases: Int) -> Color {
        if newCases > 20000 {
            return .red
        } else if newCases > 10000 {
            return .yellow
        } else {
            return .blue
        }
    }

    private func dateString(forIndex index: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = Calendar.current.date(byAdding: .day, value: index, to: startDate) {
            return dateFormatter.string(from: date)
        } else {
            return "Fecha desconocida"
        }
    }
}
