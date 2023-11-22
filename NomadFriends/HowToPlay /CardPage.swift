//
//  CardPage.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import Foundation

struct CardPage {
    let textTitle: String
    let imageName: String
}

let cards = [
    CardPage(textTitle: "Get together with friends!", imageName: "cardImage1"),
    CardPage(textTitle: "Add all players, enter their names and chose avatar", imageName: "cardImage2"),
    CardPage(textTitle: "Everyone will participate in turn and choose: Question or Action.If you choose question - answer the question, if action - please just do it and your friends will vote!", imageName: "cardImage3"),
    CardPage(textTitle: "For the correct answer or completed action you receive 1 point, for failure - you will have to drink a fun drink", imageName: "cardImage4"),
    CardPage(textTitle: "The player with the highest score will be the winner, and and with the least - the most fun! Have a great time!", imageName: "cardImage5"),
]
