//
//  HowToPlayViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class HowToPlayViewController: UIViewController {

    var currentPageIndex = 0
    
    var backgroundView = UIImageView()
    var cardView = UIImageView()
    var cardImage = UIImageView()
    var cardLabel = UILabel()
    var amountLabel = UILabel()
    var leftButton = UIButton()
    var rightButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupNavigationBar()
        updateViewForCurrentPage()
    }
    
    @objc private func leftButtonTouch() {
        if currentPageIndex > 0 {
            currentPageIndex -= 1
            updateViewForCurrentPage()
        }
    }

    @objc private func rightButtonTouch() {
        if currentPageIndex < cards.count - 1 {
            currentPageIndex += 1
            updateViewForCurrentPage()
        }
    }
    
    private func updateViewForCurrentPage() {
        let currentPage = cards[currentPageIndex]
        
        UIView.transition(with: cardImage, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.cardImage.image = UIImage(named: currentPage.imageName)
        }, completion: nil)

        UIView.transition(with: cardLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.cardLabel.text = currentPage.textTitle
        }, completion: nil)

        UIView.transition(with: amountLabel, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.amountLabel.text = "\(self.currentPageIndex + 1)/\(cards.count)"
        }, completion: nil)
    }
}

extension HowToPlayViewController {
    private func setupViews() {
        backgroundView.image = UIImage(named: "background")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        cardView.image = UIImage(named: "cardView")
        cardView.layer.masksToBounds = true
        cardView.contentMode = .scaleAspectFill
        cardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardView)
        
        cardImage.image = UIImage(named: "cardImage1")
        cardImage.layer.masksToBounds = true
        cardImage.contentMode = .scaleAspectFill
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardImage)
        
        cardLabel.text = "Add all players, enter their names and chose avatar"
        cardLabel.textColor = .white
        cardLabel.textAlignment = .center
        cardLabel.numberOfLines = 0
        cardLabel.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardLabel)
        
        leftButton.setImage(UIImage(named: "leftButton"), for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonTouch), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(leftButton)
        
        rightButton.setImage(UIImage(named: "rightButton"), for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTouch), for: .touchUpInside)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rightButton)
        
        amountLabel.text = "1/5"
        amountLabel.textColor = .white
        amountLabel.textAlignment = .center
        amountLabel.numberOfLines = 0
        amountLabel.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(amountLabel)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cardImage.topAnchor.constraint(equalTo: cardView.topAnchor),
            cardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cardLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 30),
            cardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            cardLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            amountLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            amountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            leftButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            
            rightButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            rightButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupNavigationBar() {
        let titleImageView = UIImageView(image: UIImage(named: "howToPlayNav"))
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
    }
}
