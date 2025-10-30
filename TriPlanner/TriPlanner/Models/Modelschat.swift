//
//  Datachat.swift
//  TriPlanner
//
//  Created by apprenant89 on 28/10/2025.
//

import Foundation

struct Datachat : Identifiable {
    var id : UUID = UUID()
    var nbUser  : Int
    var buddy   : User
    var message : String
    var exchange: [String]
}
 var chats = [
    Datachat(nbUser: (5), buddy: usertest, message: "bonjour", exchange:["comment ça va "]),
    Datachat(nbUser: 7, buddy: usertest, message: "salut", exchange: ["on voyage "]),
    Datachat(nbUser: 8, buddy: usertest, message: "hey", exchange: ["dans quel pays veux-tu aller "])
 ]
