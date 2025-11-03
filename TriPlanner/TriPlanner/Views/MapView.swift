//
//  MapView.swift
//  TriPlanner
//
//  Created by apprenant80 on 03/11/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    // Position de la caméra (iOS 17+)
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.624118686604305, longitude: 3.0590783088297444),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    // Marqueurs à afficher
    @State private var markers: [MapMarker] = [
        MapMarker(coordinate: CLLocationCoordinate2D(latitude: 50.624118686604305, longitude: 3.0590783088297444), title: "Simplon"),
        MapMarker(coordinate: CLLocationCoordinate2D(latitude: 50.38633485636789, longitude: 3.48920534411885), title: "New's Frites")
    ]
    
    var body: some View {
        VStack {
            // Nouvelle syntaxe iOS 17+
            Map(position: $cameraPosition) {
                // Ajouter des annotations
                ForEach(markers) { marker in
                    Annotation(marker.title, coordinate: marker.coordinate) {
                        ZStack {
                            Circle()
                                .fill(.red)
                                .frame(width: 30, height: 30)
                            Image(systemName: "mappin")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .mapStyle(.standard)
            // Options: .standard, .hybrid, .imagery
            .mapControls {
                MapCompass()
                MapScaleView()
            }
            
            // Contrôles
            HStack {
                Button("Simplon Lille") {
                    withAnimation {
                        cameraPosition = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 50.624118686604305, longitude: 3.0590783088297444),
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        )
                    }
                }
                .buttonStyle(.bordered)
                
                Button("New's Frites") {
                    withAnimation {
                        cameraPosition = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 50.38633485636789, longitude: 3.48920534411885),
                                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                            )
                        )
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }
}

// Modèle pour les marqueurs
struct MapMarker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}

// Version compatible iOS 16 (alternative)
@available(iOS 16.0, *)
struct MapViewiOS16: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 50.624118686604305, longitude: 3.0590783088297444),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Text("Utilisez MapView pour iOS 17+")
        } else {
            Map(coordinateRegion: $region, annotationItems: [
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: 50.624118686604305, longitude: 3.0590783088297444), title: "Simplon")
            ]) { marker in
                MapPin(coordinate: marker.coordinate, tint: .red)
            }
        }
    }
}

#Preview {
    MapView()
}
