//
//  CoordinatorFactory.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit

class CoordinatorFactory {
    
    func createAuthCoordinator(navigationController: UINavigationController) -> AuthFlowCoordinator {
        AuthFlowCoordinator(navigationController: navigationController)
    }
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        AppCoordinator(navigationController: navigationController)
    }
    
    func createJokeCoordinator(navigationController: UINavigationController) -> JokeFlowCoordinator {
        JokeFlowCoordinator(navigationController: navigationController)
    }
}
