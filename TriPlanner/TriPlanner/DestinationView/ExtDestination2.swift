//
//  ExtDestination2.swift
//  TriPlanner
//
//  Created by apprenant87 on 31/10/2025.
//

import SwiftUI

struct ExtDestination2: View {
    var image = Image(" ")
    var titreImage: String
    var body: some View {
        VStack{
            image
                .resizable()
                .cornerRadius(50)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
        }
        
        
        }
    }

#Preview {
    ExtDestination2(image: Image("EiffelTower"), titreImage: "Stade de Mercedes-benz")
}
