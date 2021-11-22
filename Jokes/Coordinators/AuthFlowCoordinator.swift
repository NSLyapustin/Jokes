//
//  AuthCoordinator.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit

class AuthFlowCoordinator: Coordinator {

    // MARK: - Instance Properties
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    // MARK: - Initializators
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Methods
    
    func start() {
        let viewController = StartViewController()
        
        viewController.completionHandler = { buttonType in
            switch buttonType {
            case .signIn:
                self.showSignInViewController()
                
            case .signUp:
                self.showSignUpLoginViewController()
                
            default:
                break
            }
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showSignInViewController() {
        let signInViewController = SignInViewController()
        signInViewController.completionHandler = { _ in
            self.flowCompletionHandler?()
        }
        
        navigationController.pushViewController(signInViewController, animated: true)
    }
    
    func showSignUpLoginViewController() {
        let signUpLoginViewController = SignUpLoginViewController()
        signUpLoginViewController.completionHandler = { _ in
            self.showSignUpPasswordViewController()
        }
        
        navigationController.pushViewController(signUpLoginViewController, animated: true)
    }
    
    
    func showSignUpPasswordViewController() {
        let signUpPasswordViewController = SignUpPasswordViewController()
        signUpPasswordViewController.completionHandler = { _ in
            self.flowCompletionHandler?()
        }
        
        navigationController.pushViewController(signUpPasswordViewController, animated: true)
    }
}
