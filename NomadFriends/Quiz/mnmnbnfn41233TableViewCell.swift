//
//  QuizTableViewCell.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

protocol QuizTableViewCellDelegatedqwdq12421421421: AnyObject {
    func didAnswerQuestionADdwdkDKdLoh(correctAnswers: Int)
}

final class mnmnbnfn41233TableViewCell: UITableViewCell {
    
    weak var delegate: QuizTableViewCellDelegatedqwdq12421421421?
    weak var quizViewController: cclcql3123Controller?

    static let id = String(describing: mnmnbnfn41233TableViewCell.self)
    var quizBrainQuizChponk = QuizMozgAHsaSJ()
    var answerSelected = false
    var userCorrectAnswers = 0
    weak var navigationControllerQuizChponk: UINavigationController?
    
    var popCorrectQuizChponk = UIImageView()
    var popIncorrectQuizChponk = UIImageView()
    var cardQuestionQuizChponk = UIImageView()
    var questionLabelQuizChponk = UILabel()
    var countLabelQuizChponk = UILabel()
    var firstAnswerButtonQuizChponk = UIButton()
    var secondAnswerButtonQuizChponk = UIButton()
    var thirdAnswerButtonQuizChponk = UIButton()
    var fourthAnswerButtonQuizChponk = UIButton()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dalbankqdwkdqkdq()
        dabildqp11231()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func dabildqp11231() {
        let questionText = quizBrainQuizChponk.getQuestionText()
        let answers = quizBrainQuizChponk.getAnswers()
        
        questionLabelQuizChponk.text = questionText
        firstAnswerButtonQuizChponk.setTitle(answers[0], for: .normal)
        secondAnswerButtonQuizChponk.setTitle(answers[1], for: .normal)
        thirdAnswerButtonQuizChponk.setTitle(answers[2], for: .normal)
        fourthAnswerButtonQuizChponk.setTitle(answers[3], for: .normal)
        
        countLabelQuizChponk.text = "\(quizBrainQuizChponk.questionNumber + 1)/\(quizBrainQuizChponk.quiz.count)"
        
        firstAnswerButtonQuizChponk.backgroundColor = UIColor.clear
        secondAnswerButtonQuizChponk.backgroundColor = UIColor.clear
        thirdAnswerButtonQuizChponk.backgroundColor = UIColor.clear
        fourthAnswerButtonQuizChponk.backgroundColor = UIColor.clear
        
        popCorrectQuizChponk.isHidden = true
        popIncorrectQuizChponk.isHidden = true
        
        answerSelected = false
    }
    
    @objc private func bvbvbvbvbvbvv(_ sender: UIButton) {
        if !answerSelected {
            let userAnswer = sender.currentTitle!
            let userGotItRight = quizBrainQuizChponk.checkAnswer(userAnswer: userAnswer)

            if userGotItRight {
                sender.backgroundColor = .green
                popCorrectQuizChponk.isHidden = false
                userCorrectAnswers += 1
            } else {
                sender.backgroundColor = .red
                popIncorrectQuizChponk.isHidden = false
            }
            
            quizViewController?.asxaxaxsa12131231(with: quizBrainQuizChponk.questionNumber + 1, totalQuestions: quizBrainQuizChponk.quiz.count)

            sender.layer.cornerRadius = 20
            answerSelected = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.quizBrainQuizChponk.nextQuestion()
                self.dabildqp11231()
                self.answerSelected = false
                self.delegate?.didAnswerQuestionADdwdkDKdLoh(correctAnswers: self.userCorrectAnswers)
            }
        }
    }

}

extension mnmnbnfn41233TableViewCell {
    func dalbankqdwkdqkdq() {
        contentView.addSubview(cardQuestionQuizChponk)
        contentView.addSubview(questionLabelQuizChponk)
        contentView.addSubview(firstAnswerButtonQuizChponk)
        contentView.addSubview(secondAnswerButtonQuizChponk)
        contentView.addSubview(thirdAnswerButtonQuizChponk)
        contentView.addSubview(fourthAnswerButtonQuizChponk)
        
        popCorrectQuizChponk.image = UIImage(named: "popCorrect")
        popCorrectQuizChponk.layer.masksToBounds = true
        popCorrectQuizChponk.contentMode = .scaleAspectFill
        popCorrectQuizChponk.isHidden = true
        popCorrectQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(popCorrectQuizChponk)
        
        popIncorrectQuizChponk.image = UIImage(named: "popIncorrect")
        popIncorrectQuizChponk.layer.masksToBounds = true
        popIncorrectQuizChponk.contentMode = .scaleAspectFill
        popIncorrectQuizChponk.isHidden = true
        popIncorrectQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(popIncorrectQuizChponk)
        
        cardQuestionQuizChponk.image = UIImage(named: "cardQuestion")
        cardQuestionQuizChponk.layer.masksToBounds = true
        cardQuestionQuizChponk.contentMode = .scaleAspectFill
        cardQuestionQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        
        questionLabelQuizChponk.text = "What is the 6th planet in the Solar system?"
        questionLabelQuizChponk.textColor = .white
        questionLabelQuizChponk.textAlignment = .center
        questionLabelQuizChponk.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        questionLabelQuizChponk.numberOfLines = 0
        questionLabelQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        
        firstAnswerButtonQuizChponk.setTitle("1 answer", for: .normal)
        firstAnswerButtonQuizChponk.setTitleColor(.white, for: .normal)
        firstAnswerButtonQuizChponk.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        firstAnswerButtonQuizChponk.contentHorizontalAlignment = .center
        firstAnswerButtonQuizChponk.addTarget(self, action: #selector(bvbvbvbvbvbvv(_:)), for: .touchUpInside)
        firstAnswerButtonQuizChponk.layer.cornerRadius = 20
        firstAnswerButtonQuizChponk.layer.borderWidth = 2
        firstAnswerButtonQuizChponk.layer.borderColor = UIColor.white.cgColor
        firstAnswerButtonQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        
        secondAnswerButtonQuizChponk.setTitle("2 answer", for: .normal)
        secondAnswerButtonQuizChponk.setTitleColor(.white, for: .normal)
        secondAnswerButtonQuizChponk.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        secondAnswerButtonQuizChponk.contentHorizontalAlignment = .center
        secondAnswerButtonQuizChponk.addTarget(self, action: #selector(bvbvbvbvbvbvv(_:)), for: .touchUpInside)
        secondAnswerButtonQuizChponk.layer.cornerRadius = 20
        secondAnswerButtonQuizChponk.layer.borderWidth = 2
        secondAnswerButtonQuizChponk.layer.borderColor = UIColor.white.cgColor
        secondAnswerButtonQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        
        thirdAnswerButtonQuizChponk.setTitle("3 answer", for: .normal)
        thirdAnswerButtonQuizChponk.setTitleColor(.white, for: .normal)
        thirdAnswerButtonQuizChponk.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        thirdAnswerButtonQuizChponk.contentHorizontalAlignment = .center
        thirdAnswerButtonQuizChponk.addTarget(self, action: #selector(bvbvbvbvbvbvv(_:)), for: .touchUpInside)
        thirdAnswerButtonQuizChponk.layer.cornerRadius = 20
        thirdAnswerButtonQuizChponk.layer.borderWidth = 2
        thirdAnswerButtonQuizChponk.layer.borderColor = UIColor.white.cgColor
        thirdAnswerButtonQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        
        fourthAnswerButtonQuizChponk.setTitle("4 answer", for: .normal)
        fourthAnswerButtonQuizChponk.setTitleColor(.white, for: .normal)
        fourthAnswerButtonQuizChponk.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        fourthAnswerButtonQuizChponk.contentHorizontalAlignment = .center
        fourthAnswerButtonQuizChponk.addTarget(self, action: #selector(bvbvbvbvbvbvv(_:)), for: .touchUpInside)
        fourthAnswerButtonQuizChponk.layer.cornerRadius = 20
        fourthAnswerButtonQuizChponk.layer.borderWidth = 2
        fourthAnswerButtonQuizChponk.layer.borderColor = UIColor.white.cgColor
        fourthAnswerButtonQuizChponk.translatesAutoresizingMaskIntoConstraints = false
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                cardQuestionQuizChponk.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            ])
        } else {
            NSLayoutConstraint.activate([
                cardQuestionQuizChponk.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            ])
        }
        
        NSLayoutConstraint.activate([
            popCorrectQuizChponk.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -100),
            popCorrectQuizChponk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            popIncorrectQuizChponk.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -100),
            popIncorrectQuizChponk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            cardQuestionQuizChponk.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            questionLabelQuizChponk.topAnchor.constraint(equalTo: cardQuestionQuizChponk.topAnchor, constant: 16),
            questionLabelQuizChponk.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            questionLabelQuizChponk.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            questionLabelQuizChponk.bottomAnchor.constraint(equalTo: cardQuestionQuizChponk.bottomAnchor, constant: -16),
            
            firstAnswerButtonQuizChponk.topAnchor.constraint(equalTo: cardQuestionQuizChponk.bottomAnchor, constant: 40),
            firstAnswerButtonQuizChponk.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            firstAnswerButtonQuizChponk.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            firstAnswerButtonQuizChponk.heightAnchor.constraint(equalToConstant: 60),
            
            secondAnswerButtonQuizChponk.topAnchor.constraint(equalTo: firstAnswerButtonQuizChponk.bottomAnchor, constant: 20),
            secondAnswerButtonQuizChponk.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            secondAnswerButtonQuizChponk.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            secondAnswerButtonQuizChponk.heightAnchor.constraint(equalToConstant: 60),
            
            thirdAnswerButtonQuizChponk.topAnchor.constraint(equalTo: secondAnswerButtonQuizChponk.bottomAnchor, constant: 20),
            thirdAnswerButtonQuizChponk.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            thirdAnswerButtonQuizChponk.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            thirdAnswerButtonQuizChponk.heightAnchor.constraint(equalToConstant: 60),
            
            fourthAnswerButtonQuizChponk.topAnchor.constraint(equalTo: thirdAnswerButtonQuizChponk.bottomAnchor, constant: 20),
            fourthAnswerButtonQuizChponk.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            fourthAnswerButtonQuizChponk.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            fourthAnswerButtonQuizChponk.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
