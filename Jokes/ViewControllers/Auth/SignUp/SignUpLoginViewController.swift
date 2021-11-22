//
//  SignUpLoginViewController.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import UIKit
import SnapKit

class SignUpLoginViewController: UIViewController, FlowController {
    
    var completionHandler: ((()) -> ())?
    
    // MARK: - Instance Properties
    
    // MARK: -
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Login"
        textField.textColor = .black
        textField.addTarget(self, action: #selector(onTextFieldEditing), for: .editingChanged)
        
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(onNextButtonTouchUpInside), for: .touchUpInside)
        button.isEnabled = false
        
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
        view.addSubview(loginTextField)
        view.addSubview(nextButton)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        loginTextField.snp.makeConstraints { make in
            make.width.equalTo(144)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-88)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextField.snp.bottom).offset(16)
        }
    }
    
    @objc private func onNextButtonTouchUpInside() {
        completionHandler?(())
    }
    
    @objc private func onTextFieldEditing() {
        guard let text = loginTextField.text else {
            nextButton.isEnabled = false
            return
        }
        
        if text.isEmpty {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
}
