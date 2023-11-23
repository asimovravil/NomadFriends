//
//  QuizBrain.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import Foundation

struct QuizMozgAHsaSJ {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Vopros(q: "What hormone is often called the 'love hormone'?", a: ["Oxytocin", "Adrenaline", "Dopamine", "Serotonin"], correctAnswer: "Oxytocin"),
        Vopros(q: "Which famous psychologist proposed the triangular theory of love?", a: ["Sigmund Freud", "Carl Jung", "Robert Sternberg", "Abraham Maslow"], correctAnswer: "Robert Sternberg"),
        Vopros(q: "What is the term for a fear of falling in love or emotional attachment?", a: ["Philophobia", "Agoraphobia", "Claustrophobia", "Erotophobia"], correctAnswer: "Philophobia"),
        Vopros(q: "Which of these is NOT a love language proposed by Gary Chapman?", a: ["Quality Time", "Physical Touch", "Gift Giving", "Intellectual Stimulation"], correctAnswer: "Intellectual Stimulation"),
        Vopros(q: "In which stage of a relationship do couples often experience heightened passion and attraction?", a: ["Honeymoon Phase", "Conflict Phase", "Stability Phase", "Commitment Phase"], correctAnswer: "Honeymoon Phase"),
        Vopros(q: "What is the term for an intense but short-lived passion or admiration for someone?", a: ["Infatuation", "Love", "Adoration", "Obsession"], correctAnswer: "Infatuation"),
        Vopros(q: "Which brain chemical is known for being involved in both romantic attachment and addictive behaviors?", a: ["Dopamine", "Endorphins", "Oxytocin", "Cortisol"], correctAnswer: "Dopamine"),
        Vopros(q: "In the context of love, what does 'NRE' stand for?", a: ["New Relationship Energy", "Never-Ending Romance", "Nurturing Relationship Experience", "Natural Romantic Expression"], correctAnswer: "New Relationship Energy"),
        Vopros(q: "What does the term 'polyamory' refer to?", a: ["Fear of commitment", "Multiple sexual partners", "Multiple romantic relationships", "Strict monogamy"], correctAnswer: "Multiple romantic relationships"),
        Vopros(q: "Which of these is a primary characteristic of a healthy relationship?", a: ["Codependency", "Open communication", "Intense jealousy", "Frequent arguing"], correctAnswer: "Open communication")
    ]

    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}

