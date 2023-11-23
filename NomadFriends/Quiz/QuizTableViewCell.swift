//
//  QuizTableViewCell.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

protocol QuizTableViewCellDelegate: AnyObject {
    func didAnswerQuestion(correctAnswers: Int)
}

final class QuizTableViewCell: UITableViewCell {
    
    weak var delegate: QuizTableViewCellDelegate?
    weak var quizViewController: QuizViewController?

    static let id = String(describing: QuizTableViewCell.self)
    var quizBrain = QuizBrain()
    var answerSelected = false
    var userCorrectAnswers = 0
    weak var navigationController: UINavigationController?
    
    var popCorrect = UIImageView()
    var popIncorrect = UIImageView()
    var cardQuestion = UIImageView()
    var questionLabel = UILabel()
    var countLabel = UILabel()
    var firstAnswerButton = UIButton()
    var secondAnswerButton = UIButton()
    var thirdAnswerButton = UIButton()
    var fourthAnswerButton = UIButton()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupQuizViews()
        updateKekLolUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func updateKekLolUI() {
        let questionText = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswers()
        
        questionLabel.text = questionText
        firstAnswerButton.setTitle(answers[0], for: .normal)
        secondAnswerButton.setTitle(answers[1], for: .normal)
        thirdAnswerButton.setTitle(answers[2], for: .normal)
        fourthAnswerButton.setTitle(answers[3], for: .normal)
        
        countLabel.text = "\(quizBrain.questionNumber + 1)/\(quizBrain.quiz.count)"
        
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
        fourthAnswerButton.backgroundColor = UIColor.clear
        
        popCorrect.isHidden = true
        popIncorrect.isHidden = true
        
        answerSelected = false
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        if !answerSelected {
            let userAnswer = sender.currentTitle!
            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)

            if userGotItRight {
                sender.backgroundColor = .green
                popCorrect.isHidden = false
                userCorrectAnswers += 1
            } else {
                sender.backgroundColor = .red
                popIncorrect.isHidden = false
            }
            
            quizViewController?.updateCountLabel(with: quizBrain.questionNumber + 1, totalQuestions: quizBrain.quiz.count)

            sender.layer.cornerRadius = 20
            answerSelected = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.quizBrain.nextQuestion()
                self.updateKekLolUI()
                self.answerSelected = false
                self.delegate?.didAnswerQuestion(correctAnswers: self.userCorrectAnswers)
            }
        }
    }

}

extension QuizTableViewCell {
    func setupQuizViews() {
        contentView.addSubview(cardQuestion)
        contentView.addSubview(questionLabel)
        contentView.addSubview(firstAnswerButton)
        contentView.addSubview(secondAnswerButton)
        contentView.addSubview(thirdAnswerButton)
        contentView.addSubview(fourthAnswerButton)
        
        popCorrect.image = UIImage(named: "popCorrect")
        popCorrect.layer.masksToBounds = true
        popCorrect.contentMode = .scaleAspectFill
        popCorrect.isHidden = true
        popCorrect.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(popCorrect)
        
        popIncorrect.image = UIImage(named: "popIncorrect")
        popIncorrect.layer.masksToBounds = true
        popIncorrect.contentMode = .scaleAspectFill
        popIncorrect.isHidden = true
        popIncorrect.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(popIncorrect)
        
        cardQuestion.image = UIImage(named: "cardQuestion")
        cardQuestion.layer.masksToBounds = true
        cardQuestion.contentMode = .scaleAspectFill
        cardQuestion.translatesAutoresizingMaskIntoConstraints = false
        
        questionLabel.text = "What is the 6th planet in the Solar system?"
        questionLabel.textColor = .white
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firstAnswerButton.setTitle("1 answer", for: .normal)
        firstAnswerButton.setTitleColor(.white, for: .normal)
        firstAnswerButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        firstAnswerButton.contentHorizontalAlignment = .center
        firstAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        firstAnswerButton.layer.cornerRadius = 20
        firstAnswerButton.layer.borderWidth = 2
        firstAnswerButton.layer.borderColor = UIColor.white.cgColor
        firstAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        secondAnswerButton.setTitle("2 answer", for: .normal)
        secondAnswerButton.setTitleColor(.white, for: .normal)
        secondAnswerButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        secondAnswerButton.contentHorizontalAlignment = .center
        secondAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        secondAnswerButton.layer.cornerRadius = 20
        secondAnswerButton.layer.borderWidth = 2
        secondAnswerButton.layer.borderColor = UIColor.white.cgColor
        secondAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        thirdAnswerButton.setTitle("3 answer", for: .normal)
        thirdAnswerButton.setTitleColor(.white, for: .normal)
        thirdAnswerButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        thirdAnswerButton.contentHorizontalAlignment = .center
        thirdAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        thirdAnswerButton.layer.cornerRadius = 20
        thirdAnswerButton.layer.borderWidth = 2
        thirdAnswerButton.layer.borderColor = UIColor.white.cgColor
        thirdAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        fourthAnswerButton.setTitle("4 answer", for: .normal)
        fourthAnswerButton.setTitleColor(.white, for: .normal)
        fourthAnswerButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 16)
        fourthAnswerButton.contentHorizontalAlignment = .center
        fourthAnswerButton.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        fourthAnswerButton.layer.cornerRadius = 20
        fourthAnswerButton.layer.borderWidth = 2
        fourthAnswerButton.layer.borderColor = UIColor.white.cgColor
        fourthAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popCorrect.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -100),
            popCorrect.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            popIncorrect.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -100),
            popIncorrect.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            cardQuestion.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            cardQuestion.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: cardQuestion.topAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            questionLabel.bottomAnchor.constraint(equalTo: cardQuestion.bottomAnchor, constant: -16),
            
            firstAnswerButton.topAnchor.constraint(equalTo: cardQuestion.bottomAnchor, constant: 40),
            firstAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            firstAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            firstAnswerButton.heightAnchor.constraint(equalToConstant: 60),
            
            secondAnswerButton.topAnchor.constraint(equalTo: firstAnswerButton.bottomAnchor, constant: 20),
            secondAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            secondAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            secondAnswerButton.heightAnchor.constraint(equalToConstant: 60),
            
            thirdAnswerButton.topAnchor.constraint(equalTo: secondAnswerButton.bottomAnchor, constant: 20),
            thirdAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            thirdAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            thirdAnswerButton.heightAnchor.constraint(equalToConstant: 60),
            
            fourthAnswerButton.topAnchor.constraint(equalTo: thirdAnswerButton.bottomAnchor, constant: 20),
            fourthAnswerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 47),
            fourthAnswerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -47),
            fourthAnswerButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
