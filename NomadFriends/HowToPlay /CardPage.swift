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
    CardPage(textTitle: "Add all players, enter their names \nand chose avatar", imageName: "cardImage2"),
    CardPage(textTitle: "Everyone will participate in turn \nand choose: Question or Action.If \nyou choose question - answer the \nquestion, if action - please just \ndo it and your friends will vote!", imageName: "cardImage3"),
    CardPage(textTitle: "For the correct answer or \ncompleted action you receive 1 \npoint, for failure - you will have to \nperform a sports exercise", imageName: "cardImage4"),
    CardPage(textTitle: "The player with the highest score \nwill be the winner, and and with \nthe least - the most sportive! \nHave a great time!", imageName: "cardImage5"),
]
