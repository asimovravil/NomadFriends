//
//  PageData.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import Foundation

struct PageData {
    let textTitle: String
    let textSubTitle: String
    let imageName: String
}

let pages = [
    PageData(textTitle: "Welcome to the Ultimate Party Game!", textSubTitle: "Gather your friends, it's time for Question or Action! Get ready for a hilarious and exciting game night. Choose between answering questions or taking on fun actions. Let the laughter begin!", imageName: "firstImageName"),
    PageData(textTitle: "Choose: Question or Action", textSubTitle: "If you choose question - try to answer the question correctly and receive a point, if action - please just do it and your friends will vote! For failure - you will have to drink a fun drink", imageName: "secondImageName"),
    PageData(textTitle: "Simple and Fun", textSubTitle: "Take turns picking cards with either a challenging question or a wild action. Decide whether to try your luck with a question or embrace the action. The more daring, the more fun! Let the good times roll with Question or Action.", imageName: "thirdImageName")
]
