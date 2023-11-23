//
//  ActionViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class ActionViewController: UIViewController {
    
    var backgroundView = UIImageView()
    var tableView = UITableView(frame: .zero, style: .plain)
    var cardQuestion = UIImageView()
    var questionLabel = UILabel()
    var roundImage = UIImageView()
    var danceView = UIImageView()
    var voteLabel = UILabel()
    
    var stackView = UIStackView()
    var friend1Image = UIImageView()
    var friend2Image = UIImageView()
    var friend3Image = UIImageView()
    var friend4Image = UIImageView()
    var friend5Image = UIImageView()
    var friend6Image = UIImageView()
    
    var friend1Label = UILabel()
    var friend2Label = UILabel()
    var friend3Label = UILabel()
    var friend4Label = UILabel()
    var friend5Label = UILabel()
    var friend6Label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
    }
    
    func setupLabel(_ label: UILabel, withText text: String) {
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Medium", size: 10)
        label.textColor = .white
        label.textAlignment = .center
    }
    
    func setupImageView(_ imageView: UIImageView, withImageName imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createVerticalStackView(withImageView imageView: UIImageView, andLabel label: UILabel) -> UIStackView {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let successButton = UIButton()
        successButton.setImage(UIImage(named: "success"), for: .normal)
        successButton.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [successButton, closeButton, imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}

extension ActionViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "background")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        danceView.image = UIImage(named: "dance")
        danceView.layer.masksToBounds = true
        danceView.contentMode = .scaleAspectFill
        danceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(danceView)
        
        roundImage.image = UIImage(named: "round1")
        roundImage.layer.masksToBounds = true
        roundImage.contentMode = .scaleAspectFill
        roundImage.translatesAutoresizingMaskIntoConstraints = false
        
        cardQuestion.image = UIImage(named: "cardAction")
        cardQuestion.layer.masksToBounds = true
        cardQuestion.contentMode = .scaleAspectFill
        cardQuestion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardQuestion)
        
        questionLabel.text = "Perform your best dance move for 1 minute."
        questionLabel.textColor = .white
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        questionLabel.numberOfLines = 0
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
        
        voteLabel.text = "Vote whether the score is deserved"
        voteLabel.textColor = .white
        voteLabel.textAlignment = .center
        voteLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        voteLabel.numberOfLines = 0
        voteLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(voteLabel)
        
        setupImageView(friend1Image, withImageName: "friend1")
        setupImageView(friend2Image, withImageName: "friend2")
        setupImageView(friend3Image, withImageName: "friend3")
        setupImageView(friend4Image, withImageName: "friend4")
        setupImageView(friend5Image, withImageName: "friend5")
        setupImageView(friend6Image, withImageName: "friend6")
        
        setupLabel(friend1Label, withText: "Jane")
        setupLabel(friend2Label, withText: "Jack")
        setupLabel(friend3Label, withText: "Steven")
        setupLabel(friend4Label, withText: "Mary")
        setupLabel(friend5Label, withText: "Stefani")
        setupLabel(friend6Label, withText: "Mike")
        
        let friend1Stack = createVerticalStackView(withImageView: friend1Image, andLabel: friend1Label)
        let friend2Stack = createVerticalStackView(withImageView: friend2Image, andLabel: friend2Label)
        let friend3Stack = createVerticalStackView(withImageView: friend3Image, andLabel: friend3Label)
        let friend4Stack = createVerticalStackView(withImageView: friend4Image, andLabel: friend4Label)
        let friend5Stack = createVerticalStackView(withImageView: friend5Image, andLabel: friend5Label)
        let friend6Stack = createVerticalStackView(withImageView: friend6Image, andLabel: friend6Label)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(friend1Stack)
        stackView.addArrangedSubview(friend2Stack)
        stackView.addArrangedSubview(friend3Stack)
        stackView.addArrangedSubview(friend4Stack)
        stackView.addArrangedSubview(friend5Stack)
        stackView.addArrangedSubview(friend6Stack)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            danceView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            danceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardQuestion.topAnchor.constraint(equalTo: danceView.bottomAnchor, constant: 40),
            cardQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            questionLabel.topAnchor.constraint(equalTo: cardQuestion.topAnchor, constant: 16),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            questionLabel.bottomAnchor.constraint(equalTo: cardQuestion.bottomAnchor, constant: -16),
            
            voteLabel.topAnchor.constraint(equalTo: cardQuestion.bottomAnchor, constant: 135),
            voteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
        ])
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Action"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let roundImageBarButtonItem = UIBarButtonItem(customView: roundImage)
        navigationItem.rightBarButtonItem = roundImageBarButtonItem
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
