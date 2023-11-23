//
//  ViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class TrainingViewController: UIViewController {

    var currentPage = 0
    
    var training = UIImageView()
    var pageControl = UIPageControl()
    var imageTraining = UIImageView()
    var textTitleTraining = UILabel()
    var textSubTitleTraining = UILabel()
    var nextButtonTraining = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateContentForPage(currentPage)
        setupTrainingViews()
    }

    func updateContentForPage(_ page: Int) {
        let pageData = pages[page]
        textTitleTraining.text = pageData.textTitle
        textSubTitleTraining.text = pageData.textSubTitle
        imageTraining.image = UIImage(named: pageData.imageName)
    }
    
    // Обработка нажатия на кнопку "Далее"
    @objc func nextButtonMenuChponk() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        } else {
            let controller = MenuViewController()
            controller.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        updateContentForPage(currentPage)
        pageControl.currentPage = currentPage
        
        if currentPage == pages.count - 1 {
            nextButtonTraining.setImage(UIImage(named: "startAParty"), for: .normal)
        } else {
            nextButtonTraining.setImage(UIImage(named: "next"), for: .normal)
        }
    }
}

extension TrainingViewController {
    func setupTrainingViews() {
        training.image = UIImage(named: "background")
        training.layer.masksToBounds = true
        training.contentMode = .scaleAspectFill
        training.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(training)
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = currentPage
        pageControl.currentPageIndicatorTintColor = .yellow
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        imageTraining.contentMode = .scaleAspectFit
        imageTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageTraining)
        
        textTitleTraining.textAlignment = .center
        textTitleTraining.textColor = .white
        textTitleTraining.numberOfLines = 0
        textTitleTraining.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        textTitleTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textTitleTraining)
        
        textSubTitleTraining.textAlignment = .center
        textSubTitleTraining.textColor = .white
        textSubTitleTraining.numberOfLines = 0
        textSubTitleTraining.alpha = 0.65
        textSubTitleTraining.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        textSubTitleTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textSubTitleTraining)
        
        nextButtonTraining.setImage(UIImage(named: "next"), for: .normal)
        nextButtonTraining.addTarget(self, action: #selector(nextButtonMenuChponk), for: .touchUpInside)
        nextButtonTraining.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButtonTraining)
        
        NSLayoutConstraint.activate([
            training.topAnchor.constraint(equalTo: view.topAnchor),
            training.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            training.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            training.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageTraining.topAnchor.constraint(equalTo: view.topAnchor),
            imageTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            textTitleTraining.topAnchor.constraint(equalTo: imageTraining.bottomAnchor, constant: 12),
            textTitleTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textTitleTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            textSubTitleTraining.topAnchor.constraint(equalTo: textTitleTraining.bottomAnchor, constant: 16),
            textSubTitleTraining.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textSubTitleTraining.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButtonTraining.topAnchor, constant: -17),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButtonTraining.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                nextButtonTraining.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            ])
        } else {
            NSLayoutConstraint.activate([
                nextButtonTraining.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                imageTraining.heightAnchor.constraint(equalToConstant: 340)
            ])
        }
    }
}
