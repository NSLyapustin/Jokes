//
//  JokesViewController.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import SnapKit
import UIKit

class JokesViewController: UIViewController, FlowController {
    
    var completionHandler: ((()) -> ())?
    
    // MARK: - Instance Properties
    
    // MARK: -
    
    private let jokeService = JokeService()
    
    private let jokeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupViews()
        fetchJoke()
    }
    
    // MARK: - Instance Methods
    
    // MARK: -
    
    private func fetchJoke() {
        jokeService.loadJoke { result in
            switch result {
            case .success(let joke):
                self.jokeLabel.text = joke.activity
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(jokeLabel)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        jokeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
    }
}
