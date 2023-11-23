//
//  LaderboardViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class LaderboardViewController: UIViewController {
    
    var backgroundView = UIImageView()
    var playAgainButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    @objc private func playAgainButtonTouch() {
        let controller = MenuViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension LaderboardViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "leaderBackground")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        playAgainButton.setImage(UIImage(named: "playAgain"), for: .normal)
        playAgainButton.addTarget(self, action: #selector(playAgainButtonTouch), for: .touchUpInside)
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playAgainButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            playAgainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

