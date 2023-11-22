//
//  ProfileViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var backgroundView = UIImageView()
    var cameraImageView = UIImageView()
    var editButton = UIButton()
    var levelsImage = UIImageView()
    var levelsLabel = UILabel()
    var levelsCoins = UILabel()
    var friendsLabel = UILabel()
    var cardProfileView = UIImageView()
    var deleteButton = UIButton()
    var setnameTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupNavigationBar()
    }
    
    @objc private func editButtonTouch() {
        
    }
    
    @objc private func deleteButtonTouch() {
        
    }
}

extension ProfileViewController {
    private func setupViews() {
        backgroundView.image = UIImage(named: "profileBackground")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        cameraImageView.image = UIImage(named: "cameraImage")
        cameraImageView.layer.masksToBounds = true
        cameraImageView.contentMode = .scaleAspectFill
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraImageView)
        
        editButton.setImage(UIImage(named: "editButton"), for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTouch), for: .touchUpInside)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 24)!
        ]
        setnameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: attributes)
        setnameTextField.font = UIFont(name: "SFProDisplay-Medium", size: 24)
        setnameTextField.textAlignment = .center
        setnameTextField.layer.cornerRadius = 10
        setnameTextField.textColor = .white
        setnameTextField.keyboardType = .default
        setnameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setnameTextField)
        
        cardProfileView.image = UIImage(named: "cardProfile")
        cardProfileView.layer.masksToBounds = true
        cardProfileView.contentMode = .scaleAspectFill
        cardProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardProfileView)
        
        levelsImage.image = UIImage(named: "levelImage")
        levelsImage.layer.masksToBounds = true
        levelsImage.contentMode = .scaleAspectFill
        levelsImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsImage)
        
        levelsLabel.text = "Levels"
        levelsLabel.textColor = .white
        levelsLabel.numberOfLines = 0
        levelsLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        levelsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsLabel)
        
        levelsCoins.text = "0"
        levelsCoins.textColor = .white
        levelsCoins.numberOfLines = 0
        levelsCoins.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        levelsCoins.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsCoins)
        
        friendsLabel.text = "0"
        friendsLabel.textColor = .white
        friendsLabel.numberOfLines = 0
        friendsLabel.font = UIFont(name: "SFProDisplay-SemiBold", size: 20)
        friendsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(friendsLabel)
        
        deleteButton.setImage(UIImage(named: "deleteAccount"), for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTouch), for: .touchUpInside)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cameraImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            setnameTextField.topAnchor.constraint(equalTo: cameraImageView.bottomAnchor, constant: 16),
            setnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardProfileView.topAnchor.constraint(equalTo: cameraImageView.bottomAnchor, constant: 70),
            cardProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            levelsImage.topAnchor.constraint(equalTo: cardProfileView.topAnchor, constant: 16),
            levelsImage.leadingAnchor.constraint(equalTo: cardProfileView.centerXAnchor, constant: -50),
            
            levelsLabel.topAnchor.constraint(equalTo: cardProfileView.topAnchor, constant: 19),
            levelsLabel.trailingAnchor.constraint(equalTo: cardProfileView.centerXAnchor, constant: 50),
            
            levelsCoins.topAnchor.constraint(equalTo: levelsImage.bottomAnchor, constant: 26),
            levelsCoins.leadingAnchor.constraint(equalTo: cardProfileView.leadingAnchor, constant: 80),
            
            friendsLabel.topAnchor.constraint(equalTo: levelsImage.bottomAnchor, constant: 26),
            friendsLabel.trailingAnchor.constraint(equalTo: cardProfileView.trailingAnchor, constant: -92),
            
            editButton.bottomAnchor.constraint(equalTo: cameraImageView.bottomAnchor),
            editButton.trailingAnchor.constraint(equalTo: cameraImageView.trailingAnchor),
            
            deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                cameraImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            ])
        } else {
            NSLayoutConstraint.activate([
                cameraImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            ])
        }
    }
    
    private func setupNavigationBar() {
        let titleImageView = UIImageView(image: UIImage(named: "profileNav"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
}
