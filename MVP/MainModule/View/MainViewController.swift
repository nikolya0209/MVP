//
//  ViewController.swift
//  MVP
//
//  Created by MacBookPro on 16.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    var greetingLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "ndff", size: 16)
        label.textColor = .black
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var showButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("show", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraint()
        showButton.addTarget(self, action: #selector(didTapButtonAction), for: .touchUpInside)
    }


    @objc func didTapButtonAction() {
        self.presenter.showGreeting()
    }
    
    func setConstraint() {
        view.addSubview(greetingLabel)
        view.addSubview(showButton)
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            greetingLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            showButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 40),
            showButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            showButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            showButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
