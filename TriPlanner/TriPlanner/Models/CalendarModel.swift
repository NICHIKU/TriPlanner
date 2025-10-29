//
//  CalendarModel.swift
//  TriPlanner
//
//  Created by apprenant86 on 28/10/2025.
//

import Foundation

struct Calendar : Identifiable {
    var id: UUID = UUID()
    var day : Date
    var hour: Int
    var minute: Int
    var composants = DateComponents()
}


