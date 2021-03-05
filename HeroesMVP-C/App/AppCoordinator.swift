//
//  Ф.swift
//  HeroesMVP
//
//  Created by Damir Lutfullin on 03.03.2021.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var starterCoordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(), navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
        setupStarterCoordinator()
    }
    
    func start() {
        starterCoordinator?.start()
    }

    private func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    private func setupStarterCoordinator() {
        starterCoordinator = ShowingHeroesFlowCoordinator(navigationController: navigationController)
    }
}

