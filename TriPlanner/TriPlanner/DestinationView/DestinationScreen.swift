//
//  DestinationScreen.swift
//  TriPlanner
//
//  Created by apprenant87 on 30/10/2025.
//

import SwiftUI

struct DestinationScreen: View {
    @State private var searchText = ""
    @State private var selection = "Bons plans"
    let Cities = ["Lille", "Paris", "Atlanta", "Tokyo", "Berlin", "Londres", "New York", "Stockholm", "Madrid", "Barcelone", "Rome", "Rio de Janeiro", "Mexico", "Buenos Aires", "Ottawa", "Marseille", "Pekin", "Manchester", "Pattaya", "Nice", "Rouen", "Toulouse", "Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch", "Kyoto", "Moscow", "Salerno"]
    let selections = ["Bons plans", "pour un budget + élevé"]
    
    // Propriété calculée pour filtrer les résultats
    var filteredCity: [String] {
        if searchText.isEmpty {
            return Cities
        } else {
            return Cities.filter {$0.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationStack {
            //                    Text("\(titreImage)")
            //                        .font(.caption2)
            //                    Image("MercoBenz")
            //                        .resizable()
            //                        .cornerRadius(24)
            //                        .aspectRatio(contentMode: .fit)
            //                        .frame(width: 125)
            HStack{
                Spacer()
                ExtDestination(image: Image("Tokyo"), titreImage: "Stade Mercedes-Benz, Atlanta")
                Spacer()
                ExtDestination(image: Image("Manchester"), titreImage: "London Liverpool ST, Londres")
                Spacer()
                ExtDestination(image: Image("TourEiffel"), titreImage: "Tour eiffel, Paris")
                Spacer()
                ExtDestination(image: Image("Italia"), titreImage: "Salerno, Italia")
                Spacer()
            }
            HStack{
                
                
            }
            VStack {
                Picker("Bons plans et budget + élevé", selection: $selection) {
                    ForEach(selections, id: \.self) { selection in
                        Text(selection)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                // Contenu principal
                ZStack {
                    if searchText.isEmpty {
                        // Afficher seulement un écran vide ou un message
                        VStack {
                            Spacer()
                            Text("Recherchez votre destination")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .font(.system(size: 50))
                                .foregroundColor(.gray.opacity(0.5))
                            Spacer()
                        }
                    } else {
                        // Afficher la liste des résultats filtrés
                        List(filteredCity, id: \.self) { city in
                            Text(city)
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .navigationTitle("Destination")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Entrer votre destination")
        }
    }
}
    
    
    #Preview {
        DestinationScreen()
    }
