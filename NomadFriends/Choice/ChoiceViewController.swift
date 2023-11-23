//
//  ChoiceViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    var friends: [FriendInfo] = []
    
    var backgroundView = UIImageView()
    var roundImage = UIImageView()
    var questionButton = UIButton()
    var actionButton = UIButton()
    
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
        setupPlayerLabelsAndImages()
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
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func setupPlayerLabelsAndImages() {
        let labelImagePairs = [
            (friend1Label, friend1Image),
            (friend2Label, friend2Image),
            (friend3Label, friend3Image),
            (friend4Label, friend4Image),
            (friend5Label, friend5Image),
            (friend6Label, friend6Image)
        ]

        let maxPlayers = min(friends.count, 6)

        for (index, pair) in labelImagePairs.enumerated() {
            if index < maxPlayers {
                let friend = friends[index]
                pair.0.text = friend.name
                let imageName = friend.imageName.isEmpty ? "friend1" : friend.imageName 
                pair.1.image = UIImage(named: imageName)
                pair.0.isHidden = false
                pair.1.isHidden = false
            } else {
                pair.0.isHidden = true
                pair.1.isHidden = true
            }
        }
    }
    
    @objc func questionButtonTouch() {
        let quizController = QuizViewController()
        quizController.friends = friends
        self.navigationController?.pushViewController(quizController, animated: true)
    }
    
    @objc func actionButtonTouch() {
        let actionController = ActionViewController()
        actionController.friends = friends
        self.navigationController?.pushViewController(actionController, animated: true)
    }
}

extension ChoiceViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "background")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
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
        
        roundImage.image = UIImage(named: "round1")
        roundImage.layer.masksToBounds = true
        roundImage.contentMode = .scaleAspectFill
        roundImage.translatesAutoresizingMaskIntoConstraints = false
        
        questionButton.setImage(UIImage(named: "questionCard"), for: .normal)
        questionButton.addTarget(self, action: #selector(questionButtonTouch), for: .touchUpInside)
        questionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionButton)
        
        actionButton.setImage(UIImage(named: "actionCard"), for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTouch), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            questionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90),
            questionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Question or Action?"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let roundImageBarButtonItem = UIBarButtonItem(customView: roundImage)
        navigationItem.rightBarButtonItem = roundImageBarButtonItem
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}


