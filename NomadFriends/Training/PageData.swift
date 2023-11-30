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
    PageData(textTitle: "Welcome to the \nUltimate Sport Game!", textSubTitle: "Gather your friends, it's time for Question or Action! \nGet ready for a hilarious and exciting game night. \nChoose between answering questions or taking on fun \nactions. Let the laughter begin!", imageName: "firstImageName"),
    PageData(textTitle: "Choose: \nQuestion or Action", textSubTitle: "If you choose question - try to answer the question \ncorrectly and receive a point, if action - please just do \nit and your friends will vote! For failure - you will have \nto perform a sports exercise", imageName: "secondImageName"),
    PageData(textTitle: "Simple and Fun", textSubTitle: "Take turns picking cards with either a challenging \nquestion or a wild action. Decide whether to try your \nluck with a question or embrace the action. The more \ndaring, the more fun! Let the good times roll with \nQuestion or Action.", imageName: "thirdImageName")
]
