//
//  JokeFlowCoordinator.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit

class JokeFlowCoordinator: Coordinator {

    // MARK: - Coordinator Properties
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    // MARK: - Initializators
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Methods
    
    func start() {
        
    }
}
