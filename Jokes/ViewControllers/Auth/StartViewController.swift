//
//  StartViewController.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit

class StartViewController: UIViewController, FlowController {
    
    var completionHandler: ((ButtonType?) -> ())?
    
    // MARK: - Nested Types
    
    enum ButtonType {
        case signIn
        case signUp
    }
    
    // MARK: -
    
    private enum Constants {
        fileprivate enum SignInButton {
            static var bottomInset: CGFloat = -24
        }
    }
    
    // MARK: - Instance Properties
    
    // MARK: -
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Sign in", for: .normal)
        button.addTarget(self, action: #selector(onSignInButtonTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Sign up", for: .normal)
        button.addTarget(self, action: #selector(onSignUpButtonTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupViews()
    }
    
    // MARK: - Instance Methods
    
    // MARK: -
    
    private func addSubviews() {
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        signUpButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpButton.snp.top).inset(Constants.SignInButton.bottomInset)
        }
    }
    
    @objc private func onSignInButtonTouchUpInside() {
        completionHandler?(.signIn)
    }
    
    @objc private func onSignUpButtonTouchUpInside() {
        completionHandler?(.signUp)
    }
}
