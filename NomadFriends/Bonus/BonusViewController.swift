//
//  BonusViewController.swift
//  NomadFriends
//
//  Created by Ravil on 23.11.2023.
//

import UIKit

class BonusViewController: UIViewController {
    
    var friends: [FriendInfo] = []
    
    var bonusCool = UIImageView()
    var stickViewBonusCoolak = UIImageView()
    var circleBonusBonusCoolak = UIImageView()
    var spinButtonBonusCoolak = UIButton()
    var cardDanceBonusCoolak = UIImageView()
    var cardResultBonusCoolak = UIImageView()
    var noIWontBonusCoolak = UIButton()
    var iDidItBonusCoolak = UIButton()
    var getButtonBonusCoolak = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBonusViews()
        setupBonusNavigationBar()
    }
    
    @objc private func spinButtonPressed() {
        startSpinningBonusCoolakGoAheade()
    }
    
    private func startSpinningBonusCoolakGoAheade() {
        let fullRotation = CGFloat(Double.pi * 2)
        let spinAnimation = CABasicAnimation(keyPath: "transform.rotation")
        spinAnimation.fromValue = 0.0
        spinAnimation.toValue = fullRotation
        spinAnimation.duration = 1.0
        spinAnimation.repeatCount = 3

        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.showResultBonusCoolakGoAheade()
        }
        circleBonusBonusCoolak.layer.add(spinAnimation, forKey: "360rotation")
        CATransaction.commit()
    }

    private func showResultBonusCoolakGoAheade() {
        if Bool.random() {
            cardDanceBonusCoolak.isHidden = false
            noIWontBonusCoolak.isHidden = false
            iDidItBonusCoolak.isHidden = false
        } else {
            cardResultBonusCoolak.isHidden = false
            getButtonBonusCoolak.isHidden = false
        }
    }
    
    @objc private func noIWontPressedBonusCoolakGoAheade() {
        let controller = LaderboardViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func iDidItPressedBonusCoolakGoAheade() {
        let controller = LaderboardViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func getButtonPressedBonusCoolakGoAheade() {
        let controller = LaderboardViewController()
        controller.friends = friends
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension BonusViewController {
    func setupBonusViews() {
        bonusCool.image = UIImage(named: "bonusBackground")
        bonusCool.layer.masksToBounds = true
        bonusCool.contentMode = .scaleAspectFill
        bonusCool.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bonusCool)
        
        circleBonusBonusCoolak.image = UIImage(named: "circleBonus")
        circleBonusBonusCoolak.layer.masksToBounds = true
        circleBonusBonusCoolak.contentMode = .scaleAspectFill
        circleBonusBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circleBonusBonusCoolak)
        
        stickViewBonusCoolak.image = UIImage(named: "stick")
        stickViewBonusCoolak.layer.masksToBounds = true
        stickViewBonusCoolak.contentMode = .scaleAspectFill
        stickViewBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stickViewBonusCoolak)
        
        spinButtonBonusCoolak.setImage(UIImage(named: "spin"), for: .normal)
        spinButtonBonusCoolak.addTarget(self, action: #selector(spinButtonPressed), for: .touchUpInside)
        spinButtonBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinButtonBonusCoolak)
        
        cardDanceBonusCoolak.image = UIImage(named: "cardBonusDance")
        cardDanceBonusCoolak.layer.masksToBounds = true
        cardDanceBonusCoolak.contentMode = .scaleAspectFill
        cardDanceBonusCoolak.isHidden = true
        cardDanceBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardDanceBonusCoolak)
        
        cardResultBonusCoolak.image = UIImage(named: "cardBonusResult")
        cardResultBonusCoolak.layer.masksToBounds = true
        cardResultBonusCoolak.contentMode = .scaleAspectFill
        cardResultBonusCoolak.isHidden = true
        cardResultBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardResultBonusCoolak)
        
        noIWontBonusCoolak.setImage(UIImage(named: "noIwont"), for: .normal)
        noIWontBonusCoolak.addTarget(self, action: #selector(noIWontPressedBonusCoolakGoAheade), for: .touchUpInside)
        noIWontBonusCoolak.isHidden = true
        noIWontBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noIWontBonusCoolak)
        
        iDidItBonusCoolak.setImage(UIImage(named: "iDidIt"), for: .normal)
        iDidItBonusCoolak.addTarget(self, action: #selector(iDidItPressedBonusCoolakGoAheade), for: .touchUpInside)
        iDidItBonusCoolak.isHidden = true
        iDidItBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iDidItBonusCoolak)
        
        getButtonBonusCoolak.setImage(UIImage(named: "get"), for: .normal)
        getButtonBonusCoolak.addTarget(self, action: #selector(getButtonPressedBonusCoolakGoAheade), for: .touchUpInside)
        getButtonBonusCoolak.isHidden = true
        getButtonBonusCoolak.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(getButtonBonusCoolak)
        
        NSLayoutConstraint.activate([
            bonusCool.topAnchor.constraint(equalTo: view.topAnchor),
            bonusCool.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bonusCool.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bonusCool.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            spinButtonBonusCoolak.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stickViewBonusCoolak.topAnchor.constraint(equalTo: circleBonusBonusCoolak.topAnchor),
            stickViewBonusCoolak.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            circleBonusBonusCoolak.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleBonusBonusCoolak.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cardDanceBonusCoolak.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardDanceBonusCoolak.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cardResultBonusCoolak.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardResultBonusCoolak.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            noIWontBonusCoolak.leadingAnchor.constraint(equalTo: cardDanceBonusCoolak.leadingAnchor),
            noIWontBonusCoolak.bottomAnchor.constraint(equalTo: cardDanceBonusCoolak.bottomAnchor),
            
            iDidItBonusCoolak.trailingAnchor.constraint(equalTo: cardDanceBonusCoolak.trailingAnchor),
            iDidItBonusCoolak.bottomAnchor.constraint(equalTo: cardDanceBonusCoolak.bottomAnchor),
            
            getButtonBonusCoolak.bottomAnchor.constraint(equalTo: cardResultBonusCoolak.bottomAnchor),
            getButtonBonusCoolak.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                spinButtonBonusCoolak.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        } else {
            NSLayoutConstraint.activate([
                spinButtonBonusCoolak.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            ])
        }
    }
    
    private func setupBonusNavigationBar() {
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTappedActionhahaha))
        closeButton.tintColor = .white
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func closeButtonTappedActionhahaha() {
        let controller = MenuViewController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}


