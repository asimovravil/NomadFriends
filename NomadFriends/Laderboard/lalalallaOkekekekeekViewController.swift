//
//  LaderboardViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class lalalallaOkekekekeekViewController: UIViewController {
    
    var friends: [FriendInfo] = []
    
    var laderboardKakashka = UIImageView()
    var playAgainButtonLaderboardShit = UIButton()
    
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
        
        setsesetestsetstt()
        dotdotdotdotdotdotdot()
        lolololololo()
    }
    
    private func lolololololo() {
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
                dkkqwodkow131231(pair.0, withText: "Friend")
                shtthsihrishitishihis(pair.1, withImageName: "friend1")
            }
        }
    }
    
    @objc private func xmkasxksa21331() {
        let controller = ahahah412414124ViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func dkkqwodkow131231(_ label: UILabel, withText text: String) {
        label.text = text
        label.font = UIFont(name: "SFProDisplay-Medium", size: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func shtthsihrishitishihis(_ imageView: UIImageView, withImageName imageName: String) {
        imageView.image = UIImage(named: imageName)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension lalalallaOkekekekeekViewController {
    func setsesetestsetstt() {
        laderboardKakashka.image = UIImage(named: "leaderBackground")
        laderboardKakashka.layer.masksToBounds = true
        laderboardKakashka.contentMode = .scaleAspectFill
        laderboardKakashka.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(laderboardKakashka)
        
        playAgainButtonLaderboardShit.setImage(UIImage(named: "playAgain"), for: .normal)
        playAgainButtonLaderboardShit.addTarget(self, action: #selector(xmkasxksa21331), for: .touchUpInside)
        playAgainButtonLaderboardShit.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playAgainButtonLaderboardShit)
        
        shtthsihrishitishihis(friend1Image, withImageName: "friend1")
        shtthsihrishitishihis(friend2Image, withImageName: "friend2")
        shtthsihrishitishihis(friend3Image, withImageName: "friend3")
        shtthsihrishitishihis(friend4Image, withImageName: "friend4")
        shtthsihrishitishihis(friend5Image, withImageName: "friend5")
        shtthsihrishitishihis(friend6Image, withImageName: "friend6")
        
        friend4Label.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        friend5Label.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        friend6Label.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        
        dkkqwodkow131231(friend1Label, withText: "Jane")
        dkkqwodkow131231(friend2Label, withText: "Jack")
        dkkqwodkow131231(friend3Label, withText: "Steven")
        dkkqwodkow131231(friend4Label, withText: "Mary")
        dkkqwodkow131231(friend5Label, withText: "Stefani")
        dkkqwodkow131231(friend6Label, withText: "Mike")
        
        view.addSubview(friend1Image)
        view.addSubview(friend2Image)
        view.addSubview(friend3Image)
        view.addSubview(friend4Image)
        view.addSubview(friend5Image)
        view.addSubview(friend6Image)

        view.addSubview(friend1Label)
        view.addSubview(friend2Label)
        view.addSubview(friend3Label)
        view.addSubview(friend4Label)
        view.addSubview(friend5Label)
        view.addSubview(friend6Label)
        
        NSLayoutConstraint.activate([
            laderboardKakashka.topAnchor.constraint(equalTo: view.topAnchor),
            laderboardKakashka.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            laderboardKakashka.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            laderboardKakashka.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            friend1Image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            friend1Image.heightAnchor.constraint(equalToConstant: 76),
            friend1Image.widthAnchor.constraint(equalToConstant: 76),
            
            friend1Label.topAnchor.constraint(equalTo: friend1Image.bottomAnchor, constant: 24),
            friend1Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            friend2Image.heightAnchor.constraint(equalToConstant: 66),
            friend2Image.widthAnchor.constraint(equalToConstant: 66),
            
            friend2Label.topAnchor.constraint(equalTo: friend2Image.bottomAnchor, constant: 16),
            friend2Label.centerXAnchor.constraint(equalTo: friend2Image.centerXAnchor),
            
            friend3Image.heightAnchor.constraint(equalToConstant: 66),
            friend3Image.widthAnchor.constraint(equalToConstant: 66),
            
            friend3Label.topAnchor.constraint(equalTo: friend3Image.bottomAnchor, constant: 16),
            friend3Label.centerXAnchor.constraint(equalTo: friend3Image.centerXAnchor),
            
            friend4Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            
            friend4Label.leadingAnchor.constraint(equalTo: friend4Image.trailingAnchor, constant: 16),
            
            friend5Image.topAnchor.constraint(equalTo: friend4Image.bottomAnchor, constant: 22),
            friend5Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            
            friend5Label.topAnchor.constraint(equalTo: friend4Label.bottomAnchor, constant: 52),
            friend5Label.leadingAnchor.constraint(equalTo: friend5Image.trailingAnchor, constant: 16),
            
            friend6Image.topAnchor.constraint(equalTo: friend5Image.bottomAnchor, constant: 22),
            friend6Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            
            friend6Label.topAnchor.constraint(equalTo: friend5Label.bottomAnchor, constant: 52),
            friend6Label.leadingAnchor.constraint(equalTo: friend6Image.trailingAnchor, constant: 16),
                        
            playAgainButtonLaderboardShit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                friend1Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 173),
                friend3Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 225),
                friend3Image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
                friend2Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 225),
                friend2Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
                friend4Image.topAnchor.constraint(equalTo: friend3Image.bottomAnchor, constant: 196),
                friend4Label.topAnchor.constraint(equalTo: friend3Image.bottomAnchor, constant: 210),
                playAgainButtonLaderboardShit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        } else {
            NSLayoutConstraint.activate([
                friend1Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 93),
                friend3Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
                friend3Image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
                friend2Image.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
                friend2Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
                friend4Image.topAnchor.constraint(equalTo: friend3Image.bottomAnchor, constant: 176),
                friend4Label.topAnchor.constraint(equalTo: friend3Image.bottomAnchor, constant: 190),
                playAgainButtonLaderboardShit.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
    
    private func dotdotdotdotdotdotdot() {
        let titleLabel = UILabel()
        titleLabel.text = "Final Scoreboard"
        titleLabel.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(ldwqdlw131313123))
        closeButton.tintColor = .white
        navigationItem.leftBarButtonItem = closeButton
                
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func ldwqdlw131313123() {
        let controller = ahahah412414124ViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

