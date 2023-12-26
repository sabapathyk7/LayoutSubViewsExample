//
//  SceneDelegate.swift
//  LayoutSubViewsExample
//
//  Created by kanagasabapathy on 25/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window = window as UIWindow? else {
            window?.makeKeyAndVisible()
            return
        }
        let viewController: UIViewController = ViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
