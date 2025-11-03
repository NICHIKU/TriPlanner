//
//  CalendarExtract.swift
//  TriPlanner
//
//  Created by apprenant86 on 31/10/2025.
//
import Foundation
import SwiftUI

struct CalendarExtract: View {
    @State private var selectedDate = Date()
    @State private var dateRetour = Date()
    
    
    var body: some View {
        Form {
            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
            DatePicker("Départ", selection: $selectedDate, displayedComponents: .hourAndMinute)
            DatePicker("Retour", selection: $dateRetour)
        }
    }
}

#Preview {
    CalendarExtract()
}
