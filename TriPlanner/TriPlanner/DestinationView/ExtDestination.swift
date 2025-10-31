//
//  ExtDestination.swift
//  TriPlanner
//
//  Created by apprenant87 on 29/10/2025.
//

import SwiftUI

struct ExtDestination: View {
    var image = Image(" ")
    var titreImage: String
    var body: some View {
        VStack{
            image
                .resizable()
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
        }
        
        
        }
    }

#Preview {
    ExtDestination(image: Image("MercoBenz"), titreImage: "stade Mercedes-benz, Atlanta")
}
