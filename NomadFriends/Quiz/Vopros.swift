//
//  Question.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import Foundation

struct Vopros {
    let text: String
    
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
