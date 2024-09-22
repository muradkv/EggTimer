//
//  ViewController.swift
//  EggTimer
//
//  Created by murad on 22.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let mainVerticalStackView: CustomStackView = {
        let stackView = CustomStackView(axis: .vertical, spacing: 39)
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    let timerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 211 / 255, green: 241 / 255, blue: 251 / 255, alpha: 1)
        
        view.addSubview(mainVerticalStackView)
        
        mainVerticalStackView.addArrangedSubview(titleLabel)
        setupEggStackView()
        mainVerticalStackView.addArrangedSubview(timerView)
        
        NSLayoutConstraint.activate([
            mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupEggStackView() {
        let stackView = CustomStackView(axis: .horizontal, spacing: 20)
        mainVerticalStackView.addArrangedSubview(stackView)
        
        let images = [
            UIImage(named: "soft_egg"),
            UIImage(named: "medium_egg"),
            UIImage(named: "hard_egg"),
        ]
        
        let buttonTitle = [
            "soft", "medium", "hard"
        ]
        
        images.enumerated().forEach { index, image in
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(buttonTitle[index], for: .normal)
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            
            containerView.addSubview(button)
            containerView.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: containerView.topAnchor),
                button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                
                imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
                imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            
            stackView.addArrangedSubview(containerView)
        }
    }

}

