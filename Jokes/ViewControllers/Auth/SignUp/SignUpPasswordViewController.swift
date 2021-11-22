//
//  SignUpPasswordViewController.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit
import SnapKit

class SignUpPasswordViewController: UIViewController, FlowController {
    
    var completionHandler: ((()) -> ())?
    
    // MARK: - Instance Properties
    
    // MARK: -
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        textField.textColor = .black
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(onNextButtonTouchUpInside), for: .touchUpInside)
        
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
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(144)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-88)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
        }
    }
    
    @objc private func onNextButtonTouchUpInside() {
        completionHandler?(())
    }
}

