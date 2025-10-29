//
//  ActivitiesModel.swift
//  TriPlanner
//
//  Created by apprenant90 on 29/10/2025.
//

import Foundation

struct Comment : Identifiable {
    var id : UUID = UUID()
    var userComment : User
    var contentComment : String
    var dateComment : Date
}
