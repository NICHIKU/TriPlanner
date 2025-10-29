//
//  UserExtract.swift
//  TriPlanner
//
//  Created by apprenant90 on 29/10/2025.
//

import SwiftUI

struct UserExtract: View {
var user1 : User = usertest
    var body: some View {
        HStack {
            user1.profileImage
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .clipShape(Circle())
            Text(user1.username)
                .font(.title)
        }
    }
}

#Preview {
    UserExtract()
}
