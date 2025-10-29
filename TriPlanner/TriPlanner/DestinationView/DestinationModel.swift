//
//  DataDestination.swift
//  TriPlanner
//
//  Created by apprenant87 on 28/10/2025.
//

import UIKit

struct Destination : Identifiable {
    var id: UUID = UUID()
    var localisationCountry: String
    var localisationCity: String
    var imageBonsPlans: UIImage?
    var price: Double
    var adresse: String
    var rating: Double
}
