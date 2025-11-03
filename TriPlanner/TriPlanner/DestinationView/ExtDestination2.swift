//
//  ExtDestination2.swift
//  TriPlanner
//
//  Created by apprenant87 on 03/11/2025.
//

import SwiftUI

struct ExtDestination2: View {
    var image = Image(" ")
    var titreImage: String
    var body: some View {
        VStack{
            Text("\(titreImage)")
            image
                .resizable()
                .cornerRadius(32)
                .aspectRatio(contentMode: .fit)
                .frame(width: 375)
                .padding(5)
        }
        
        
        }
    }

#Preview {
    ExtDestination2(image: Image("MexicoPyramid"), titreImage: "Chichén Itzá, Mérida, Mexico")
}
