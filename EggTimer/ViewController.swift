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
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .systemYellow
        progressView.trackTintColor = .systemGray
        progressView.progress = 0.5
        return progressView
    }()
    
    let timerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

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
        setupProgressView()
        
        NSLayoutConstraint.activate([
            mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupProgressView() {
        timerView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            progressView.heightAnchor.constraint(equalToConstant: 5),
            progressView.leadingAnchor.constraint(equalTo: timerView.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: timerView.trailingAnchor),
            progressView.centerYAnchor.constraint(equalTo: timerView.centerYAnchor)
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
        
        let buttonTitles = [
            ("Soft", 5),
            ("Medium", 10),
            ("Hard", 13)
        ]
        
        images.enumerated().forEach { index, image in
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(buttonTitles[index].0, for: .normal)
            button.addAction(UIAction { _ in
                self.startTimer(count: buttonTitles[index].1 )
                self.titleLabel.text = buttonTitles[index].0
            }, for: .touchUpInside)
            
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
    
    private func startTimer(count: Int ) {
        timer.invalidate()
        
        totalTime = count
        
        progressView.progress = 0.0
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                
                self.secondsPassed += 1
                self.progressView.progress = Float(self.secondsPassed) / Float(self.totalTime)
                
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!"
            }
        }
    }

}

