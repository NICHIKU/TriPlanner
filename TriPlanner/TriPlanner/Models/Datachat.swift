//
//  Datachat.swift
//  TriPlanner
//
//  Created by apprenant89 on 28/10/2025.
//

import Foundation

struct Datachat : Identifiable {
    var id : UUID = UUID()
    var nbUser  : Int
    var buddy   : User
    var message : String
    var exchange: [String]
}
