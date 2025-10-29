//
//  User.swift
//  TriPlanner
//
//  Created by apprenant90 on 28/10/2025.
//

import Foundation
import SwiftUI


struct User : Identifiable {
    var id: UUID = UUID()
    var username: String
    var realName: String
    var password : String
    var profileImage: Image
    var mail : String = ""
    var phoneNumber : Int = 0
    var isAdmin: Bool

}


