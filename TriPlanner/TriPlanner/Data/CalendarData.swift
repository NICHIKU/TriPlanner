//
//  CalendarData.swift
//  TriPlanner
//
//  Created by apprenant86 on 28/10/2025.
//

import Foundation

let calendarTest: Calendar = Calendar(day: Date.now, hour: 16, minute: 23)

let calendarTableTest: [Calendar] = [
    Calendar(day: Date.now, hour: 15, minute: 45),
    Calendar(day: Date(), hour: 23, minute: 18),
    calendarTest,
    Calendar(day: Date(), hour: 3, minute: 59)
]
