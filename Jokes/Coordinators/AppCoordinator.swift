//
//  AppCoordinator.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Instance Properties
    
    let userDefaults = UserDefaults.standard
    let navigationController: UINavigationController
    
    // MARK: - Initializators
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Instance Methods
    
    func start() {
        if userDefaults.bool(forKey: "IsNotFirstAuth") {
            showJokesFlow()
        } else {
//            userDefaults.set(true, forKey: "IsNotFirstAuth")
            showAuthFlow()
        }
    }
    
    // MARK: -
    
    private func showJokesFlow() {
        let jokeFlowCoordinator = JokeFlowCoordinator(navigationController: navigationController)
        jokeFlowCoordinator.start()
    }
    
    private func showAuthFlow() {
        let authJokesFlow = AuthFlowCoordinator(navigationController: navigationController)
        authJokesFlow.flowCompletionHandler = {
            self.showJokesFlow()
        }
        authJokesFlow.start()
    }
}
