//
//  SceneDelegate.swift
//  CSVReader
//
//  Created by Paulo Correa on 12/04/2022.
//

import UIKit
import class RootCoordinator.RootCoordinator
import protocol Core.CoordinatorProtocol

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var rootCoordinator: CoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()
        UINavigationBar.appearance().customNavigationBar()

        let rootCoordinator: RootCoordinator = RootCoordinator(navigationController: navigationController)
        rootCoordinator.start()
        self.rootCoordinator = rootCoordinator

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}
