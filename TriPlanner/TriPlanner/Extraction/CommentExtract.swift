//
//  CommentExtract.swift
//  TriPlanner
//
//  Created by apprenant90 on 29/10/2025.
//
import SwiftUI

struct CommentExtract: View {
    @Binding var comments: [Comment]
    @State private var userInput: String = ""
    
    var body: some View {
        
            VStack{
                Spacer()
                    .frame(height: 100)
                HStack {
                    TextField("Comment", text: $userInput)
                        .padding(.horizontal, 15)
                    
                    Button(action: addComment) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                            .padding(.horizontal, 15)
                    }
                }
                .frame(width: 300, height: 50)
                .background(Color.white)
                .cornerRadius(30)
                
                Spacer()
                    .frame(height: 20)
                ScrollView(.vertical, showsIndicators: false){
                    
                    HStack {
                        VStack{
                            Text("Comments")
                                .font(.largeTitle)
                                .bold()
                                .padding()
                            
                            VStack(alignment: .leading){
                                ForEach(comments) { comment in
                                    HStack{
                                        comment.userComment.profileImage
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40)
                                            .clipShape(Circle())
                                        Text(comment.contentComment)
                                            .padding(.vertical, 15)
                                    }
                                }
                            }
                                .frame(maxWidth: 250)
                        }
                    }
                }
                .frame(maxWidth: 350,maxHeight: 150)
                .background(Color.white)
                .cornerRadius(30)
            }
        }
    
    private func addComment() {
        // Vérifier que le texte n'est pas vide
        guard !userInput.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        // Créer un nouveau commentaire
        let newComment = Comment(userComment: usertest, contentComment: userInput, dateComment: Date.now)
        
        // Ajouter à la liste
        comments.append(newComment)
        
        // Vider le TextField
        userInput = ""
    }

}

 

    

#Preview {
    @Previewable @State var previewComments = commentSection
        
        CommentExtract(comments: $previewComments)
}
