//
//  Create.swift
//  TriPlanner
//
//  Created by apprenant90 on 03/11/2025.
//

import SwiftUI
import PhotosUI

struct Create: View {
    
    @State private var userInput: String = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var processedImage: Image?
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack{
                VStack {
                    Text("Test")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack(alignment: .center) {
                        Spacer()
                            .frame(width: 40)
                        PhotosPicker(selection: $selectedItem) {
                            if let processedImage {
                                processedImage
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                            }
                        }
                        
                        .onChange(of: selectedItem, loadImage)
                        .frame(width: 200, height: 200)
                        
                        VStack {
                            Text("Nommez cette activité")
                                .font(.caption)
                                .foregroundColor(.gray)
                            TextField("Nom de l'activité", text: $userInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        .frame(width: 200)
                        Spacer()
                            .frame(width: 60)

                    }
                }
                .frame(width: 380, height: 330)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
    }
    
    func save() {
        guard !userInput.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        _ = Activities(ownerAct: usertest, titleAct: userInput, ratingAct: [], imageAct: processedImage ?? Image(systemName: "questionmark"), comments: [])
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let uiImage = UIImage(data: imageData) else { return }
            processedImage = Image(uiImage: uiImage)
        }
    }
}


#Preview {
    Create()
}
