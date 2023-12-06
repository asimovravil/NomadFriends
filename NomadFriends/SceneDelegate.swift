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
        window?.rootViewController = xasxxasxax2112412412()
        window?.makeKeyAndVisible()
    
        doqwodwqo123123.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = xcmcxmvvmfdqwdwq11313123(url: url)
            } else {
                if !csd8c2313123.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: dqwd12311231ViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}
