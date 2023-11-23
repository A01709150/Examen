//
//  ContentView.swift
//  Examen
//
//  Created by Diego Perdomo Salcedo on 22/11/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    
    
    
    var body: some View {
        VStack{
            ScrollView {
                Text("hola")
            }
        }.onAppear{
            Task {
                await contentViewModel.getContentList()
            }
        }
        
    }   
    
}

