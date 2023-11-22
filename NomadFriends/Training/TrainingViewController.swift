//
//  ViewController.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class TrainingViewController: UIViewController {

    var currentPage = 0
    
    var backgroundView = UIImageView()
    var pageControl = UIPageControl()
    var imageView = UIImageView()
    var textTitleView = UILabel()
    var textSubTitleView = UILabel()
    var nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateContentForPage(currentPage)
        setupViews()
    }

    func updateContentForPage(_ page: Int) {
        let pageData = pages[page]
        textTitleView.text = pageData.textTitle
        textSubTitleView.text = pageData.textSubTitle
        imageView.image = UIImage(named: pageData.imageName)
    }
    
    // Обработка нажатия на кнопку "Далее"
    @objc func nextButtonTapped() {
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
            nextButton.setImage(UIImage(named: "startAParty"), for: .normal)
        } else {
            nextButton.setImage(UIImage(named: "next"), for: .normal)
        }
    }
}

extension TrainingViewController {
    func setupViews() {
        backgroundView.image = UIImage(named: "background")
        backgroundView.layer.masksToBounds = true
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = currentPage
        pageControl.currentPageIndicatorTintColor = .yellow
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        textTitleView.textAlignment = .center
        textTitleView.textColor = .white
        textTitleView.numberOfLines = 0
        textTitleView.font = UIFont(name: "SFProDisplay-Bold", size: 32)
        textTitleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textTitleView)
        
        textSubTitleView.textAlignment = .center
        textSubTitleView.textColor = .white
        textSubTitleView.numberOfLines = 0
        textSubTitleView.alpha = 0.65
        textSubTitleView.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        textSubTitleView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textSubTitleView)
        
        nextButton.setImage(UIImage(named: "next"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            textTitleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            textTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            textSubTitleView.topAnchor.constraint(equalTo: textTitleView.bottomAnchor, constant: 16),
            textSubTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textSubTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -17),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            ])
        } else {
            NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 340)
            ])
        }
    }
}
