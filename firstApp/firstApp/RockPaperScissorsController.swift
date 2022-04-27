//
//  RockPaperScissorsController.swift
//  firstApp
//
//  Created by Admin on 3/30/22.
//

import UIKit

class RockPaperScissorsController: UIViewController {
    
    var nameOfGame: UILabel! = {
            let label = UILabel()
            label.text = "Rock Paper Scissors Game"
            label.numberOfLines = 0
            label.sizeToFit()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    var ResultLabel: UILabel! = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    

    
    lazy var rockButton: UIButton = {
        let rockButton = UIButton()
        rockButton.setTitle("👊🏿", for: .normal)
        rockButton.titleLabel?.font = .systemFont(ofSize: 26, weight: .medium)
        rockButton.tag = 1
        rockButton.backgroundColor = .systemGray3
        rockButton.addAction(UIAction() { [weak self] _ in
            self?.gameRPS(sender: rockButton)
        }, for: .touchUpInside)
        rockButton.layer.cornerRadius = 20
            rockButton.translatesAutoresizingMaskIntoConstraints = false
        return rockButton
    }()
    
    lazy var paperButton: UIButton = {
        let paperButton = UIButton(frame: CGRect(origin: .zero, size: .init(width: 224, height: 55)))
        paperButton.setTitle("🤚🏿", for: .normal)
        paperButton.titleLabel?.font = .systemFont(ofSize: 26, weight: .medium)
        paperButton.tag = 2
        paperButton.backgroundColor = .systemGray3
        paperButton.addAction(UIAction() { [weak self] _ in
            self?.gameRPS(sender: paperButton)
        }, for: .touchUpInside)
        paperButton.layer.cornerRadius = 20
        paperButton.translatesAutoresizingMaskIntoConstraints = false
        return paperButton
    }()
    
    lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton(frame: CGRect(origin: .zero, size: .init(width: 224, height: 55)))
        scissorsButton.setTitle("✌🏿", for: .normal)
        scissorsButton.titleLabel?.font = .systemFont(ofSize: 26, weight: .medium)
        scissorsButton.tag = 3
        scissorsButton.backgroundColor = .systemGray3
        scissorsButton.addAction(UIAction() { [weak self] _ in
            self?.gameRPS(sender: scissorsButton)
        }, for: .touchUpInside)
        scissorsButton.layer.cornerRadius = 20
        scissorsButton.translatesAutoresizingMaskIntoConstraints = false
        return scissorsButton
    }()
    

    
    lazy var restartButton: UIButton = {
        let restartButton = UIButton(frame: CGRect(origin: .zero, size: .init(width: 224, height: 55)))
        restartButton.setTitle("Restart Game", for: .normal)
        restartButton.backgroundColor = .systemCyan
        restartButton.addAction(UIAction() { [weak self] _ in
            self?.actionRestartButton()
        }, for: .touchUpInside)
        restartButton.layer.cornerRadius = 20
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.isHidden = true
        return restartButton
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBarIfPossible()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rockButton.center = view.center
        ResultLabel.center = view.center
        
        NSLayoutConstraint.activate([
        
        
        paperButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        scissorsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        paperButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 475),
        scissorsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 520),
        restartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),

        
        rockButton.heightAnchor.constraint(equalToConstant: 36),
        rockButton.widthAnchor.constraint(equalToConstant: 224),
        
        paperButton.heightAnchor.constraint(equalToConstant: 36),
        paperButton.widthAnchor.constraint(equalToConstant: 224),
        
        scissorsButton.heightAnchor.constraint(equalToConstant: 36),
        scissorsButton.widthAnchor.constraint(equalToConstant: 224),
        
        restartButton.heightAnchor.constraint(equalToConstant: 36),
        restartButton.widthAnchor.constraint(equalToConstant: 224),
        
        nameOfGame.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
        nameOfGame.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

private extension RockPaperScissorsController {
    

    func setupNavigationBarIfPossible() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "gearshape.fill",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)),
            for: .normal)
        button.imageView?.tintColor = .black
        button.addAction(UIAction() { [weak self] _ in
            self?.routeToSettings()
        }, for: .touchUpInside)
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: button) ]
    }
    
    func routeToSettings() {
        let obSettings = SettingsController()
        self.navigationController?.pushViewController(obSettings, animated: true)
    }
    

    func setupView() {
        view.addSubview(nameOfGame)
        
        view.backgroundColor = .white
        
        
        view.addSubview(rockButton)
        view.addSubview(paperButton)
        view.addSubview(scissorsButton)
        view.addSubview(restartButton)
    }
    
    func gameRPS(sender: UIButton) {
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        let randomChoice = Int.random(in: 0...2)
        switch randomChoice {
        case 0:
                switch sender.tag {
                case 1:
                    if drawSwitch.isOn {
                    ResultLabel.text = "Ничья"
                    } else {
                        gameRPS(sender: rockButton)
                    }
                case 2:
                    ResultLabel.text = "Поражение"
                case 3:
                    ResultLabel.text = "Победа"
                default:
                    ResultLabel.text = ""
                }
        case 1:
                switch sender.tag {
                case 1:
                    ResultLabel.text = "Победа"
                case 2:
                    if drawSwitch.isOn {
                    ResultLabel.text = "Ничья"
                    } else {
                        gameRPS(sender: paperButton)
                }
                case 3:
                    ResultLabel.text = "Поражение"
                default:
                    ResultLabel.text = ""
                }
        case 2:
                switch sender.tag {
                case 1:
                    ResultLabel.text = "Поражение"
                case 2:
                    ResultLabel.text = "Победа"
                case 3:
                    if drawSwitch.isOn {
                    ResultLabel.text = "Ничья"
                    } else {
                        gameRPS(sender: scissorsButton)
                    }
                default:
                    ResultLabel.text = ""
                }
            default:
                ResultLabel.text = ""
            }
        restartButton.isHidden = false
        printRes()
    }
    
    func printRes() {
        
        switch ResultLabel.text {
        case "Поражение":
            view.backgroundColor = .systemRed
            if languageSwitch.isOn {
                ResultLabel.text = "Вы проиграли"
            } else {
                ResultLabel.text = "You lose"
            }
        case "Победа":
            view.backgroundColor = .systemGreen
            if languageSwitch.isOn {
                ResultLabel.text = "Вы выиграли"
            } else {
                ResultLabel.text = "You win"
            }
        case "Ничья":
            if drawSwitch.isOn {
            view.backgroundColor = .systemGray
            if languageSwitch.isOn {
                ResultLabel.text = "Ничья"
            } else {
                ResultLabel.text = "Draw"
            }
            }
        case .none:
            break
        case .some(_):
            break
        }
        ResultLabel.isHidden = false
        view.addSubview(ResultLabel)
        restartButton.isHidden = false
        view.addSubview(restartButton)
    }
    
    func actionRestartButton() {
        ResultLabel.isHidden = true
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        restartButton.isHidden = true
        view.backgroundColor = .white
    }
    

    
}


// 0 - камень 1 - ножницы 2 - бумага
