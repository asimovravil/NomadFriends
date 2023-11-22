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
    var cardProfileView = UIImageView()
    var deleteButton = UIButton()

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
        
        cardProfileView.image = UIImage(named: "cardProfile")
        cardProfileView.layer.masksToBounds = true
        cardProfileView.contentMode = .scaleAspectFill
        cardProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardProfileView)
        
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
            
            cardProfileView.topAnchor.constraint(equalTo: cameraImageView.bottomAnchor, constant: 70),
            cardProfileView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
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
