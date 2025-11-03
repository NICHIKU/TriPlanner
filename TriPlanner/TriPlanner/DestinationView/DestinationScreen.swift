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
                    HStack{
                        Spacer()
                        ExtDestination(image: Image("Tokyo"), titreImage: "Stade Mercedes-Benz, Atlanta")
                        Spacer()
                        ExtDestination(image: Image("Manchester"), titreImage: "London Liverpool ST, Londres")
                        Spacer()
                        ExtDestination(image: Image("TourEiffel"), titreImage: "Tour eiffel, Paris")
                        Spacer()
                        ExtDestination(image: Image("China"), titreImage: "Chine")
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

                        } else {
                            // Afficher la liste des résultats filtrés
                            List(filteredCity, id: \.self) { city in
                                Text(city)
                            }
                            .listStyle(.plain)
                        }
                    }
                    ScrollView(){
                        ExtDestination2(image: Image("MexicoPyramid"), titreImage: "Chichén Itzá, Mérida, Mexique")
                        ExtDestination2(image: Image("RioDeJaneiro"), titreImage: "Rio De Janeiro, Brésil")
                        Spacer()
                        ExtDestination2(image: Image("MadridView"), titreImage: "Calle Gran Vía, Madrid, Espagne")
                        Spacer()
                        ExtDestination2(image: Image("TokyoView"), titreImage: "Tokyo, Japon")
                        Spacer()
                        ExtDestination2(image: Image("BarceloneView"), titreImage: "Barcelone, Espagne")
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

