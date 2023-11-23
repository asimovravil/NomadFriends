//
//  FirstNavigationViewController.swift
//  Mayan Secrets
//
//  Created by Ravil on 10.11.2023.
//

import UIKit

final class RoutineViewController: UIViewController {
    
    private let loadingBackground = UIImageView()
    private let loadingRotation = UIImageView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addedLoadingSetup()
        addedLoadingValue()
        addedLoadingConstraints()
    }
    
    func addedLoadingSetup() {
        view.addSubview(loadingBackground)
        view.addSubview(loadingRotation)
        circleLogicSplashAnimation()
    }
    
    func addedLoadingValue() {
        loadingRotation.image = UIImage(named: "loading")
        loadingRotation.layer.masksToBounds = true
        loadingRotation.contentMode = .scaleAspectFill
        loadingRotation.translatesAutoresizingMaskIntoConstraints = false
        
        loadingBackground.image = UIImage(named: "loadingBackground")
        loadingBackground.layer.masksToBounds = true
        loadingBackground.contentMode = .scaleAspectFill
        loadingBackground.translatesAutoresizingMaskIntoConstraints = false
    }

    private func circleLogicSplashAnimation() {
        let fastFullAnimation = CGFloat(Double.pi * 2)
        let splashLoadAnim = CABasicAnimation(keyPath: "transform.rotation")
        splashLoadAnim.fromValue = 0.0
        splashLoadAnim.toValue = fastFullAnimation
        splashLoadAnim.duration = 1.0
        splashLoadAnim.repeatCount = .greatestFiniteMagnitude
        self.loadingRotation.layer.add(splashLoadAnim, forKey: "360rotation")
    }
}

extension RoutineViewController {
    func addedLoadingConstraints() {
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                loadingRotation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
            ])
        } else {
            NSLayoutConstraint.activate([
                loadingRotation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            ])
        }
        NSLayoutConstraint.activate([
            loadingBackground.topAnchor.constraint(equalTo: view.topAnchor),
            loadingBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingRotation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
