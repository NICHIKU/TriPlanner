//
//  TransportExtract.swift
//
//
//  Created by apprenant80 on 29/10/2025.
//
// Copyrights ©Lasselin Jimmy

import SwiftUI

struct TransportView: View {

    // MARK: - Propriétés d'état

    /// Index de l'émoji actuellement sélectionné dans le carousel
    @State private var selectedIndex = 0

    /// Timer pour l'animation automatique du carousel
    @State private var timer: Timer?
    
    /// Émojis 

    /// Stockage du transport sélectionné

    @State private var selectedTransport = "Transports"

    // MARK: - Données

    /// Liste des émojis de transport affichés dans le carousel
    let emojis = ["🚗", "✈️", "🚅", "🚙", "🚲", "🚌"]

    // MARK: - Body

    var body: some View {
        ZStack {
            // Fond bleu qui remplit tout l'écran
            Color.backgroundColorBlue
                .ignoresSafeArea()

            VStack {
                // Bouton titre "Transports" en haut
                Menu {
                    Button("🚗 Voiture") {
                        selectedTransport = "🚗 Voiture"
                    }
                    Button("🚙 Covoiturage") {
                        selectedTransport = "🚙 Covoiturage"
                    }
                    Button("✈️ Avion") {
                        selectedTransport = "✈️ Avion"
                    }
                    Button("🚅 Train") {
                        selectedTransport = "🚅 Train"
                    }
                    Button("🚌 Bus") {
                        selectedTransport = "🚌 Bus"
                    }
                    Button("🚲 Vélo") {
                        selectedTransport = "🚲 Vélo"
                    }
                } label: {
                    Text(selectedTransport)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .opacity(0.75)
                .padding(.bottom, 60)

                // MARK: Carousel d'émojis

                GeometryReader { geometry in
                    // ScrollViewReader permet de contrôler le scroll programmatiquement
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                // Boucle sur chaque émoji avec son index
                                ForEach(
                                    Array(emojis.enumerated()),
                                    id: \.offset
                                ) { index, emoji in
                                    Text(emoji)
                                        .font(.system(size: 70))
                                        // L'émoji sélectionné est plus grand (120%) et les autres plus petits (80%)
                                        .scaleEffect(
                                            selectedIndex == index ? 1.2 : 0.8
                                        )
                                        // L'émoji sélectionné est opaque, les autres semi-transparents
                                        .opacity(
                                            selectedIndex == index ? 1.0 : 0.5
                                        )
                                        // Animation fluide lors du changement de sélection
                                        .animation(
                                            .spring(response: 0.3),
                                            value: selectedIndex
                                        )
                                        // ID nécessaire pour scrollTo()
                                        .id(index)
                                        // Permet de sélectionner un émoji manuellement
                                        .onTapGesture {
                                            withAnimation {
                                                selectedIndex = index
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 40)
                        }
                        // Démarre l'animation automatique quand la vue apparaît
                        .onAppear {
                            startAutoScroll(proxy: proxy)
                        }
                        // Arrête l'animation quand la vue disparaît
                        .onDisappear {
                            stopAutoScroll()
                        }
                    }
                }
                .frame(height: 150)

                // Bouton "Continuer" en bas
                Button {
                    // Action du bouton (à définir)
                } label: {
                    Text("Continuer")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                }
                .opacity(0.75)
            }
        }
    }

    // MARK: - Fonctions privées

    /// Démarre le défilement automatique du carousel
    /// - Parameter proxy: ScrollViewProxy pour contrôler le scroll
    private func startAutoScroll(proxy: ScrollViewProxy) {
        // Timer qui se déclenche toutes les 1 seconde
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                // Passe à l'émoji suivant, revient au début après le dernier
                selectedIndex = (selectedIndex + 1) % emojis.count
                // Fait défiler la vue pour centrer l'émoji sélectionné
                proxy.scrollTo(selectedIndex, anchor: .center)
            }
        }
    }

    /// Arrête le timer du carousel et libère les ressources
    private func stopAutoScroll() {
        timer?.invalidate()  // Arrête le timer
        timer = nil  // Libère la mémoire
    }
}

#Preview {
    TransportView()
}
