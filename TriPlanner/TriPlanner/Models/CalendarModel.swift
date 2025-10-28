//
//  CalendarModel.swift
//  TriPlanner
//
//  Created by apprenant86 on 28/10/2025.
//

import Foundation

struct Calendar : Identifiable {
    var id: UUID = UUID()
    var day: Int
    var month: Int
    var year: Int
    var hour: Int
    var minute: Int
}
