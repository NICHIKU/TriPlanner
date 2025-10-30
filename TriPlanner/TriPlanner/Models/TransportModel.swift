//
//  TransportModel.swift
//  TriPlanner
//
//  Created by apprenant80 on 29/10/2025.
//
import SwiftUI
import Foundation

enum TypeTransport {
    case voiture
    case covoiturage
    case train
    case avion
    case bus
    case velo
}

struct Transport : Identifiable {
    var id: UUID = UUID()
    var icon: Image
    var typeTransport: TypeTransport
}


