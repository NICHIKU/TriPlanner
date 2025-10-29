//
//  DataDestination.swift
//  TriPlanner
//
//  Created by apprenant87 on 28/10/2025.
//

import Foundation
import SwiftUI

struct Destination : Identifiable {
    var id: UUID = UUID()
    var localisationCountry: String
    var localisationCity: String
    var imageBonsPlans: Image
    var price: Double
    var adresse: String
    var rating: Double
}
 var destinations = [
    Destination(localisationCountry: "France", localisationCity: "Paris", imageBonsPlans: Image("EiffelTower"), price: 36.10, adresse: "Av. Gustave Eiffel, 75007 Paris", rating: 4.8),
    Destination(localisationCountry: "États-Unis", localisationCity: "Atlanta", imageBonsPlans: Image("MercoBenz"), price: 78, adresse: "1 AMB Dr NW", rating: 4.7),
    Destination(localisationCountry: "La Reunion", localisationCity: "Sainte-Marie", imageBonsPlans: Image(""), price: 12.2, adresse: "32 Rue Michel Ange", rating: 4.1)
]
