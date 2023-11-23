//
//  MenuViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class MenuViewController: UIViewController {

    var menuMenu = UIImageView()
    var startAPartyButton = UIButton()
    var howToPlayButton = UIButton()
    var profileButton = UIButton()
    var settingsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenuViews()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func startAPartyButtonTouch() {
        let controller = StartAPartyViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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
    func setupMenuViews() {
        menuMenu.image = UIImage(named: "menuBackground")
        menuMenu.layer.masksToBounds = true
        menuMenu.contentMode = .scaleAspectFill
        menuMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuMenu)
        
        startAPartyButton.setImage(UIImage(named: "startAPartyButton"), for: .normal)
        startAPartyButton.addTarget(self, action: #selector(startAPartyButtonTouch), for: .touchUpInside)
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
            menuMenu.topAnchor.constraint(equalTo: view.topAnchor),
            menuMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
