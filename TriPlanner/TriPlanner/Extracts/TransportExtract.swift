//
//  TransportExtract.swift
//  
//
//  Created by apprenant80 on 29/10/2025.
//

import SwiftUI

struct TransportExtract: View {
    var body: some View {
        ZStack {
            Color.backgroundColorBlue
                .ignoresSafeArea()
            
            VStack {
                Button{
                    
                }label:{
                    Text("Transports")
                }
                .padding(10)
                .foregroundStyle(.black)
                .background(Color.white)
                .cornerRadius(10)
                .opacity(0.75)
                HStack{
                    Text("✈️")
                    Text("🚅")
                        .padding(.leading, 50)
                    Text("🚗")
                        .padding(.leading, 50)
                }
                .padding(.top, 50)
                .font(.system(size: 60))
            }
        }
    }
}

#Preview {
    TransportExtract()
}
