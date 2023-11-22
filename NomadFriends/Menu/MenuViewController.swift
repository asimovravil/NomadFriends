//
//  MenuViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class MenuViewController: UIViewController {

    var backgroundView = UIImageView()
    var startAPartyButton = UIButton()
    var howToPlayButton = UIButton()
    var profileButton = UIButton()
    var settingsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func howToPlayButtonTouch() {
        let controller = HowToPlayViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func settingsButtonTouch() {
        let controller = SettingsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func profileButtonTouch() {
        let controller = ProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MenuViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "menuBackground")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        startAPartyButton.setImage(UIImage(named: "startAPartyButton"), for: .normal)
        startAPartyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startAPartyButton)
        
        howToPlayButton.setImage(UIImage(named: "howToPlayButton"), for: .normal)
        howToPlayButton.addTarget(self, action: #selector(howToPlayButtonTouch), for: .touchUpInside)
        howToPlayButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(howToPlayButton)
        
        profileButton.setImage(UIImage(named: "profileButton"), for: .normal)
        profileButton.addTarget(self, action: #selector(profileButtonTouch), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        settingsButton.setImage(UIImage(named: "settingsButton"), for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsButtonTouch), for: .touchUpInside)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            startAPartyButton.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -40),
            startAPartyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            howToPlayButton.bottomAnchor.constraint(equalTo: settingsButton.topAnchor, constant: -40),
            howToPlayButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                profileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -92),
                settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -92),
            ])
        } else {
            NSLayoutConstraint.activate([
                profileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            ])
        }
    }
}
