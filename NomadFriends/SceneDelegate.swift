//
//  SceneDelegate.swift
//  NomadFriends
//
//  Created by Ravil on 22.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: UINavigationController!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = RoutineViewController()
        window?.makeKeyAndVisible()
    
        SamsaExternalDownloading.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = ApplicationWebBurgerViewController(url: url)
            } else {
                if !UIKitAppStore.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: dqwd12311231ViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}
