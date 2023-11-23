//
//  BonusViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class BonusViewController: UIViewController {
    
    var friends: [FriendInfo] = []
    
    var backgroundView = UIImageView()
    var stickView = UIImageView()
    var circleBonusView = UIImageView()
    var spinButton = UIButton()
    var cardDanceView = UIImageView()
    var cardResultView = UIImageView()
    var noIWont = UIButton()
    var iDidIt = UIButton()
    var getButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigationBar()
    }
    
    @objc private func spinButtonPressed() {
        startSpinning()
    }
    
    private func startSpinning() {
        let fullRotation = CGFloat(Double.pi * 2)
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
        spinAnimation.fromValue = 0.0
        spinAnimation.toValue = fullRotation
        spinAnimation.duration = 1.0
        spinAnimation.repeatCount = 3

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.showResult()
        }
        circleBonusView.layer.add(spinAnimation, forKey: "360rotation")
        CATransaction.commit()
    }

    private func showResult() {
        if Bool.random() {
            cardDanceView.isHidden = false
            noIWont.isHidden = false
            iDidIt.isHidden = false
        } else {
            cardResultView.isHidden = false
            getButton.isHidden = false
        }
    }
    
    @objc private func noIWontPressed() {
        let controller = LaderboardViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func iDidItPressed() {
        let controller = LaderboardViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func getButtonPressed() {
        let controller = LaderboardViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension BonusViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "bonusBackground")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        circleBonusView.image = UIImage(named: "circleBonus")
        circleBonusView.layer.masksToBounds = true
        circleBonusView.contentMode = .scaleAspectFill
        circleBonusView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circleBonusView)
        
        stickView.image = UIImage(named: "stick")
        stickView.layer.masksToBounds = true
        stickView.contentMode = .scaleAspectFill
        stickView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stickView)
        
        spinButton.setImage(UIImage(named: "spin"), for: .normal)
        spinButton.addTarget(self, action: #selector(spinButtonPressed), for: .touchUpInside)
        spinButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinButton)
        
        cardDanceView.image = UIImage(named: "cardBonusDance")
        cardDanceView.layer.masksToBounds = true
        cardDanceView.contentMode = .scaleAspectFill
        cardDanceView.isHidden = true
        cardDanceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardDanceView)
        
        cardResultView.image = UIImage(named: "cardBonusResult")
        cardResultView.layer.masksToBounds = true
        cardResultView.contentMode = .scaleAspectFill
        cardResultView.isHidden = true
        cardResultView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardResultView)
        
        noIWont.setImage(UIImage(named: "noIwont"), for: .normal)
        noIWont.addTarget(self, action: #selector(noIWontPressed), for: .touchUpInside)
        noIWont.isHidden = true
        noIWont.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noIWont)
        
        iDidIt.setImage(UIImage(named: "iDidIt"), for: .normal)
        iDidIt.addTarget(self, action: #selector(iDidItPressed), for: .touchUpInside)
        iDidIt.isHidden = true
        iDidIt.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iDidIt)
        
        getButton.setImage(UIImage(named: "get"), for: .normal)
        getButton.addTarget(self, action: #selector(getButtonPressed), for: .touchUpInside)
        getButton.isHidden = true
        getButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(getButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            spinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stickView.topAnchor.constraint(equalTo: circleBonusView.topAnchor),
            stickView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            circleBonusView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleBonusView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cardDanceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardDanceView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cardResultView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardResultView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            noIWont.leadingAnchor.constraint(equalTo: cardDanceView.leadingAnchor),
            noIWont.bottomAnchor.constraint(equalTo: cardDanceView.bottomAnchor),
            
            iDidIt.trailingAnchor.constraint(equalTo: cardDanceView.trailingAnchor),
            iDidIt.bottomAnchor.constraint(equalTo: cardDanceView.bottomAnchor),
            
            getButton.bottomAnchor.constraint(equalTo: cardResultView.bottomAnchor),
            getButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                spinButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        } else {
            NSLayoutConstraint.activate([
                spinButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            ])
        }
    }
    
    private func setupNavigationBar() {
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = .white
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func closeButtonTapped() {
        let controller = MenuViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


