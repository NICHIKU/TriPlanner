import SwiftUI
struct ActivityExtract: View {
    @State var at: Activities = activityTest
    @State private var selectedRating: Int = 0
    @State private var hasRated: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: -160) { // Changez cette valeur pour ajuster l'écart (10-20 est bien)
                // Card de l'activité
                VStack {
                    Text(at.titleAct)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack(alignment: .center) {
                        at.imageAct
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        Spacer()
                            .frame(width: 10)
                        VStack {
                            // Affichage de la note moyenne
                            HStack {
                                Text(at.getRating().description)
                                    .font(.system(size: 40))
                                Image(systemName: "star.fill")
                                    .font(.system(size: 40))
                                    .offset(y: -2)
                            }
                            
                            // Système d'étoiles pour noter
                            VStack(spacing: 10) {
                                Text("Notez cette activité")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                HStack(spacing: 5) {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: index <= selectedRating ? "star.fill" : "star")
                                            .font(.system(size: 15))
                                            .foregroundColor(index <= selectedRating ? .yellow : .gray)
                                            .onTapGesture {
                                                selectedRating = index
                                            }
                                    }
                                }
                                
                                // Bouton pour valider la note
                                Button(action: {
                                    if selectedRating > 0 {
                                        at.addRating(selectedRating)
                                        hasRated = true
                                    }
                                }) {
                                    Text(hasRated ? "Note ajoutée ✓" : "Valider")
                                        .font(.caption)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 5)
                                        .background(hasRated ? Color.green : Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                .disabled(selectedRating == 0 || hasRated)
                            }
                        }
                    }
                }
                .frame(width: 350, height: 330)
                .background(Color.white)
                .cornerRadius(20)
                
                // Section des commentaires
                CommentExtract(comments: $at.comments)
            }
        }
    }
}
#Preview {
    ActivityExtract()
}
