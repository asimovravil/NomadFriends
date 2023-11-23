//
//  ChoiceViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class ahaheaqwddqwd123123ViewController: UIViewController {
    
    var friends: [FriendInfo] = []
    
    var choceOpinion = UIImageView()
    var roundImageOpinion = UIImageView()
    var questionButtonOpinion = UIButton()
    var actionButtonOpinion = UIButton()
    
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
        
        djqwdqjj32112313()
        jzccjxczjc123123()
        gekggjhhgh141()
    }
    
    func cmacasc4121421(_ label: UILabel, withText text: String) {
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Medium", size: 10)
        label.textColor = .white
        label.textAlignment = .center
    }
    
    func csndncmsncsm1241112(_ imageView: UIImageView, withImageName imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func vcxmnbvxcnmvcx4124112(withImageView imageView: UIImageView, andLabel label: UILabel) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func gekggjhhgh141() {
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
                cmacasc4121421(pair.0, withText: "Friend")
                csndncmsncsm1241112(pair.1, withImageName: "friend1")
            }
        }
    }
    
    @objc func iowgiwwfijw1424214() {
        let quizController = cclcql3123Controller()
        quizController.friends = friends
        self.navigationController?.pushViewController(quizController, animated: true)
    }
    
    @objc func xxnczxczxbc12411241412() {
        let actionController = lhltehrhegwqewqeViewController()
        actionController.friends = friends
        self.navigationController?.pushViewController(actionController, animated: true)
    }
}

extension ahaheaqwddqwd123123ViewController {
    func djqwdqjj32112313() {
        choceOpinion.image = UIImage(named: "background")
        choceOpinion.layer.masksToBounds = true
        choceOpinion.contentMode = .scaleAspectFill
        choceOpinion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(choceOpinion)
        
        csndncmsncsm1241112(friend1Image, withImageName: "friend1")
        csndncmsncsm1241112(friend2Image, withImageName: "friend2")
        csndncmsncsm1241112(friend3Image, withImageName: "friend3")
        csndncmsncsm1241112(friend4Image, withImageName: "friend4")
        csndncmsncsm1241112(friend5Image, withImageName: "friend5")
        csndncmsncsm1241112(friend6Image, withImageName: "friend6")
        
        cmacasc4121421(friend1Label, withText: "Jane")
        cmacasc4121421(friend2Label, withText: "Jack")
        cmacasc4121421(friend3Label, withText: "Steven")
        cmacasc4121421(friend4Label, withText: "Mary")
        cmacasc4121421(friend5Label, withText: "Stefani")
        cmacasc4121421(friend6Label, withText: "Mike")
        
        let friend1Stack = vcxmnbvxcnmvcx4124112(withImageView: friend1Image, andLabel: friend1Label)
        let friend2Stack = vcxmnbvxcnmvcx4124112(withImageView: friend2Image, andLabel: friend2Label)
        let friend3Stack = vcxmnbvxcnmvcx4124112(withImageView: friend3Image, andLabel: friend3Label)
        let friend4Stack = vcxmnbvxcnmvcx4124112(withImageView: friend4Image, andLabel: friend4Label)
        let friend5Stack = vcxmnbvxcnmvcx4124112(withImageView: friend5Image, andLabel: friend5Label)
        let friend6Stack = vcxmnbvxcnmvcx4124112(withImageView: friend6Image, andLabel: friend6Label)
        
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
        
        roundImageOpinion.image = UIImage(named: "round1")
        roundImageOpinion.layer.masksToBounds = true
        roundImageOpinion.contentMode = .scaleAspectFill
        roundImageOpinion.translatesAutoresizingMaskIntoConstraints = false
        
        questionButtonOpinion.setImage(UIImage(named: "questionCard"), for: .normal)
        questionButtonOpinion.addTarget(self, action: #selector(iowgiwwfijw1424214), for: .touchUpInside)
        questionButtonOpinion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionButtonOpinion)
        
        actionButtonOpinion.setImage(UIImage(named: "actionCard"), for: .normal)
        actionButtonOpinion.addTarget(self, action: #selector(xxnczxczxbc12411241412), for: .touchUpInside)
        actionButtonOpinion.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionButtonOpinion)
        
        NSLayoutConstraint.activate([
            choceOpinion.topAnchor.constraint(equalTo: view.topAnchor),
            choceOpinion.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            choceOpinion.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            choceOpinion.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            questionButtonOpinion.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90),
            questionButtonOpinion.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            actionButtonOpinion.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            actionButtonOpinion.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
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
    
    private func jzccjxczjc123123() {
        let titleLabel = UILabel()
        titleLabel.text = "Question or Action?"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let roundImageBarButtonItem = UIBarButtonItem(customView: roundImageOpinion)
        navigationItem.rightBarButtonItem = roundImageBarButtonItem
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}


