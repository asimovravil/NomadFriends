//
//  ActionViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class lhltehrhegwqewqeViewController: UIViewController {
    
    var popCorrectAction = UIImageView()
    var popIncorrectAction = UIImageView()
    
    var friends: [FriendInfo] = []
    
    var successClickCountAction = 0
    var closeClickCountAction = 0
    
    var actionBatAction = UIImageView()
    var tableViewAction = UITableView(frame: .zero, style: .plain)
    var cardQuestionAction = UIImageView()
    var questionLabelAction = UILabel()
    var roundImageAction = UIImageView()
    var danceViewAction = UIImageView()
    var voteLabelAction = UILabel()
    
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
        
        udqwiudqwiu13123()
        nbnbnbnn24231()
        yohrtohrto2343242()
    }
    
    private func yohrtohrto2343242() {
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
                dwqkd1312321(pair.0, withText: "Friend")
                dkdkwqdkq123123(pair.1, withImageName: "friend1")
            }
        }
    }
    
    func dwqkd1312321(_ label: UILabel, withText text: String) {
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Medium", size: 10)
        label.textColor = .white
        label.textAlignment = .center
    }
    
    func dkdkwqdkq123123(_ imageView: UIImageView, withImageName imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func bcsdcbdsbc1231321(withImageView imageView: UIImageView, andLabel label: UILabel) -> UIStackView {
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.addTarget(self, action: #selector(ldwqdlw131313123), for: .touchUpInside)
        
        let successButton = UIButton()
        successButton.setImage(UIImage(named: "success"), for: .normal)
        successButton.translatesAutoresizingMaskIntoConstraints = false
        
        successButton.addTarget(self, action: #selector(successButtonTappedActionhahaha), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [successButton, closeButton, imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    @objc func successButtonTappedActionhahaha() {
        successClickCountAction += 1
        closeClickCountAction = max(closeClickCountAction - 1, 0)
        checkForTransitionActionhahaha()
    }

    @objc func ldwqdlw131313123() {
        closeClickCountAction += 1
        successClickCountAction = max(successClickCountAction - 1, 0)
        checkForTransitionActionhahaha()
    }
    
    func checkForTransitionActionhahaha() {
        let totalVotes = successClickCountAction + closeClickCountAction
        let majority = (friends.count / 2) + 1

        if totalVotes >= majority {
            if successClickCountAction > closeClickCountAction {
                showPopupAndTransitionActionhahaha(imageView: popCorrectAction)
            } else if closeClickCountAction > successClickCountAction {
                showPopupAndTransitionActionhahaha(imageView: popIncorrectAction)
            }
        }
    }

    func showPopupAndTransitionActionhahaha(imageView: UIImageView) {
        imageView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let controller = gerge4312414214ViewController()
            controller.friends = self.friends
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}

extension lhltehrhegwqewqeViewController {
    func udqwiudqwiu13123() {
        actionBatAction.image = UIImage(named: "background")
        actionBatAction.layer.masksToBounds = true
        actionBatAction.contentMode = .scaleAspectFill
        actionBatAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(actionBatAction)
        
        popCorrectAction.image = UIImage(named: "popCorrect")
        popCorrectAction.layer.masksToBounds = true
        popCorrectAction.contentMode = .scaleAspectFill
        popCorrectAction.isHidden = true
        popCorrectAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popCorrectAction)
        
        popIncorrectAction.image = UIImage(named: "tryHarderIncorrect")
        popIncorrectAction.layer.masksToBounds = true
        popIncorrectAction.contentMode = .scaleAspectFill
        popIncorrectAction.isHidden = true
        popIncorrectAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popIncorrectAction)
        
        danceViewAction.image = UIImage(named: "dance")
        danceViewAction.layer.masksToBounds = true
        danceViewAction.contentMode = .scaleAspectFill
        danceViewAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(danceViewAction)
        
        roundImageAction.image = UIImage(named: "round1")
        roundImageAction.layer.masksToBounds = true
        roundImageAction.contentMode = .scaleAspectFill
        roundImageAction.translatesAutoresizingMaskIntoConstraints = false
        
        cardQuestionAction.image = UIImage(named: "cardAction")
        cardQuestionAction.layer.masksToBounds = true
        cardQuestionAction.contentMode = .scaleAspectFill
        cardQuestionAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardQuestionAction)
        
        questionLabelAction.text = "Perform your best dance move for 1 minute."
        questionLabelAction.textColor = .white
        questionLabelAction.textAlignment = .center
        questionLabelAction.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        questionLabelAction.numberOfLines = 0
        questionLabelAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabelAction)
        
        voteLabelAction.text = "Vote whether the score is deserved"
        voteLabelAction.textColor = .white
        voteLabelAction.textAlignment = .center
        voteLabelAction.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        voteLabelAction.numberOfLines = 0
        voteLabelAction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(voteLabelAction)
        
        dkdkwqdkq123123(friend1Image, withImageName: "friend1")
        dkdkwqdkq123123(friend2Image, withImageName: "friend2")
        dkdkwqdkq123123(friend3Image, withImageName: "friend3")
        dkdkwqdkq123123(friend4Image, withImageName: "friend4")
        dkdkwqdkq123123(friend5Image, withImageName: "friend5")
        dkdkwqdkq123123(friend6Image, withImageName: "friend6")
        
        dwqkd1312321(friend1Label, withText: "Jane")
        dwqkd1312321(friend2Label, withText: "Jack")
        dwqkd1312321(friend3Label, withText: "Steven")
        dwqkd1312321(friend4Label, withText: "Mary")
        dwqkd1312321(friend5Label, withText: "Stefani")
        dwqkd1312321(friend6Label, withText: "Mike")
        
        let friend1Stack = bcsdcbdsbc1231321(withImageView: friend1Image, andLabel: friend1Label)
        let friend2Stack = bcsdcbdsbc1231321(withImageView: friend2Image, andLabel: friend2Label)
        let friend3Stack = bcsdcbdsbc1231321(withImageView: friend3Image, andLabel: friend3Label)
        let friend4Stack = bcsdcbdsbc1231321(withImageView: friend4Image, andLabel: friend4Label)
        let friend5Stack = bcsdcbdsbc1231321(withImageView: friend5Image, andLabel: friend5Label)
        let friend6Stack = bcsdcbdsbc1231321(withImageView: friend6Image, andLabel: friend6Label)
        
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
            actionBatAction.topAnchor.constraint(equalTo: view.topAnchor),
            actionBatAction.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            actionBatAction.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionBatAction.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            popCorrectAction.topAnchor.constraint(equalTo: view.topAnchor),
            popCorrectAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            popIncorrectAction.topAnchor.constraint(equalTo: view.topAnchor),
            popIncorrectAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            danceViewAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardQuestionAction.topAnchor.constraint(equalTo: danceViewAction.bottomAnchor, constant: 40),
            cardQuestionAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            questionLabelAction.topAnchor.constraint(equalTo: cardQuestionAction.topAnchor, constant: 16),
            questionLabelAction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            questionLabelAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            questionLabelAction.bottomAnchor.constraint(equalTo: cardQuestionAction.bottomAnchor, constant: -16),
            
            voteLabelAction.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                danceViewAction.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
                voteLabelAction.topAnchor.constraint(equalTo: cardQuestionAction.bottomAnchor, constant: 135),
            ])
        } else {
            NSLayoutConstraint.activate([
                danceViewAction.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
                voteLabelAction.topAnchor.constraint(equalTo: cardQuestionAction.bottomAnchor, constant: 70),
            ])
        }
    }
    
    private func nbnbnbnn24231() {
        let titleLabel = UILabel()
        titleLabel.text = "Action"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let roundImageBarButtonItem = UIBarButtonItem(customView: roundImageAction)
        navigationItem.rightBarButtonItem = roundImageBarButtonItem
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
