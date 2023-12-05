//
//  MenuViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class ahahah412414124ViewController: UIViewController {

    var menuMenu = UIImageView()
    var startAPartyButtonMenu = UIButton()
    var howToPlayButtonMenu = UIButton()
    var profileButtonMenu = UIButton()
    var settingsButtonMenu = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vcascsmacm214214214()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc private func cascal321() {
        let controller = dwq1gnrvxqViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func mnbbnm3441() {
        let controller = dqwdwq412211d12ViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func febbel1412412() {
        let controller = lalallafqjqfjqwf12321312ViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func vfjvjv4124414() {
        let controller = gwefwe123ViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension ahahah412414124ViewController {
    func vcascsmacm214214214() {
        menuMenu.image = UIImage(named: "menuBackground")
        menuMenu.layer.masksToBounds = true
        menuMenu.contentMode = .scaleAspectFill
        menuMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuMenu)
        
        startAPartyButtonMenu.setImage(UIImage(named: "startATrainingButton"), for: .normal)
        startAPartyButtonMenu.addTarget(self, action: #selector(cascal321), for: .touchUpInside)
        startAPartyButtonMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startAPartyButtonMenu)
        
        howToPlayButtonMenu.setImage(UIImage(named: "howToPlayButton"), for: .normal)
        howToPlayButtonMenu.addTarget(self, action: #selector(mnbbnm3441), for: .touchUpInside)
        howToPlayButtonMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(howToPlayButtonMenu)
        
        profileButtonMenu.setImage(UIImage(named: "profileButton"), for: .normal)
        profileButtonMenu.addTarget(self, action: #selector(vfjvjv4124414), for: .touchUpInside)
        profileButtonMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButtonMenu)
        
        settingsButtonMenu.setImage(UIImage(named: "settingsButton"), for: .normal)
        settingsButtonMenu.addTarget(self, action: #selector(febbel1412412), for: .touchUpInside)
        settingsButtonMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsButtonMenu)
        
        NSLayoutConstraint.activate([
            menuMenu.topAnchor.constraint(equalTo: view.topAnchor),
            menuMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileButtonMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            settingsButtonMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            startAPartyButtonMenu.bottomAnchor.constraint(equalTo: profileButtonMenu.topAnchor, constant: -40),
            startAPartyButtonMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            
            howToPlayButtonMenu.bottomAnchor.constraint(equalTo: settingsButtonMenu.topAnchor, constant: -40),
            howToPlayButtonMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                profileButtonMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -92),
                settingsButtonMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -92),
            ])
        } else {
            NSLayoutConstraint.activate([
                profileButtonMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
                settingsButtonMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            ])
        }
    }
}
