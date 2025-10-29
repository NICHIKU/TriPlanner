//
//  ActivitiesModel.swift
//  TriPlanner
//
//  Created by apprenant90 on 29/10/2025.
//

import Foundation
import SwiftUI

struct Activities : Identifiable {
    var id : UUID = UUID()
    var ownerAct : User
    var titleAct : String
    var ratingAct : [Int]
    var imageAct : Image
    var comments : [Comment]
    
    func getRating() -> Double {
        var sum : Double = 0
        for i in ratingAct {
            sum += Double(i)
        }
        return sum / Double(ratingAct.count)
    }
    
    mutating func addRating(_ rating: Int) {
        ratingAct.append(rating)
    }
}
