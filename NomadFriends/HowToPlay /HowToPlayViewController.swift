//
//  HowToPlayViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class HowToPlayViewController: UIViewController {

    var currentPageIndex = 0
    
    var goStart = UIImageView()
    var cardViewFAQ = UIImageView()
    var cardImageFAQ = UIImageView()
    var cardLabelFAQ = UILabel()
    var amountLabelFAQ = UILabel()
    var leftButtonFAQ = UIButton()
    var rightButtonFAQ = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupFAQViews()
        setupFAQNavigationBar()
        updateViewForCurrentPageFAQChponk()
    }
    
    @objc private func leftButtonFAQChponk() {
        if currentPageIndex > 0 {
            currentPageIndex -= 1
            updateViewForCurrentPageFAQChponk()
        }
    }

    @objc private func rightButtonFAQChponk() {
        if currentPageIndex < cards.count - 1 {
            currentPageIndex += 1
            updateViewForCurrentPageFAQChponk()
        }
    }
    
    private func updateViewForCurrentPageFAQChponk() {
        let currentPage = cards[currentPageIndex]
        
        UIView.transition(with: cardImageFAQ, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.cardImageFAQ.image = UIImage(named: currentPage.imageName)
        }, completion: nil)

        UIView.transition(with: cardLabelFAQ, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.cardLabelFAQ.text = currentPage.textTitle
        }, completion: nil)

        UIView.transition(with: amountLabelFAQ, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.amountLabelFAQ.text = "\(self.currentPageIndex + 1)/\(cards.count)"
        }, completion: nil)
    }
}

extension HowToPlayViewController {
    private func setupFAQViews() {
        goStart.image = UIImage(named: "background")
        goStart.layer.masksToBounds = true
        goStart.contentMode = .scaleAspectFill
        goStart.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goStart)
        
        cardViewFAQ.image = UIImage(named: "cardView")
        cardViewFAQ.layer.masksToBounds = true
        cardViewFAQ.contentMode = .scaleAspectFill
        cardViewFAQ.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardViewFAQ)
        
        cardImageFAQ.image = UIImage(named: "cardImage1")
        cardImageFAQ.layer.masksToBounds = true
        cardImageFAQ.contentMode = .scaleAspectFill
        cardImageFAQ.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardImageFAQ)
        
        cardLabelFAQ.text = "Add all players, enter their names and chose avatar"
        cardLabelFAQ.textColor = .white
        cardLabelFAQ.textAlignment = .center
        cardLabelFAQ.numberOfLines = 0
        cardLabelFAQ.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        cardLabelFAQ.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardLabelFAQ)
        
        leftButtonFAQ.setImage(UIImage(named: "leftButton"), for: .normal)
        leftButtonFAQ.addTarget(self, action: #selector(leftButtonFAQChponk), for: .touchUpInside)
        leftButtonFAQ.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftButtonFAQ)
        
        rightButtonFAQ.setImage(UIImage(named: "rightButton"), for: .normal)
        rightButtonFAQ.addTarget(self, action: #selector(rightButtonFAQChponk), for: .touchUpInside)
        rightButtonFAQ.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightButtonFAQ)
        
        amountLabelFAQ.text = "1/5"
        amountLabelFAQ.textColor = .white
        amountLabelFAQ.textAlignment = .center
        amountLabelFAQ.numberOfLines = 0
        amountLabelFAQ.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        amountLabelFAQ.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountLabelFAQ)
        
        NSLayoutConstraint.activate([
            goStart.topAnchor.constraint(equalTo: view.topAnchor),
            goStart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            goStart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            goStart.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cardViewFAQ.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardViewFAQ.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cardImageFAQ.topAnchor.constraint(equalTo: cardViewFAQ.topAnchor),
            cardImageFAQ.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardLabelFAQ.topAnchor.constraint(equalTo: cardImageFAQ.bottomAnchor, constant: 30),
            cardLabelFAQ.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            cardLabelFAQ.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            amountLabelFAQ.bottomAnchor.constraint(equalTo: cardViewFAQ.bottomAnchor, constant: -16),
            amountLabelFAQ.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftButtonFAQ.bottomAnchor.constraint(equalTo: cardViewFAQ.bottomAnchor, constant: -16),
            leftButtonFAQ.leadingAnchor.constraint(equalTo: cardViewFAQ.leadingAnchor, constant: 16),
            
            rightButtonFAQ.bottomAnchor.constraint(equalTo: cardViewFAQ.bottomAnchor, constant: -16),
            rightButtonFAQ.trailingAnchor.constraint(equalTo: cardViewFAQ.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupFAQNavigationBar() {
        let titleImageView = UIImageView(image: UIImage(named: "howToPlayNav"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
}
