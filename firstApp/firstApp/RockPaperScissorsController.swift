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
    
    var languageLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 100, y: 150, width: 80, height: 30))
        label.text = "Ru"
       // label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var drawLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 100, y: 250, width: 80, height: 30))
        label.text = "Draw on"
       // label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rockButton: UIButton = {
        let rockButton = UIButton()
        rockButton.setTitle("👊🏿", for: .normal)
        rockButton.backgroundColor = .systemGray3
        rockButton.addAction(UIAction() { [weak self] _ in
            self?.rockButtonAction()
        }, for: .touchUpInside)
        rockButton.layer.cornerRadius = 20
            rockButton.translatesAutoresizingMaskIntoConstraints = false
        return rockButton
    }()
    
    private lazy var paperButton: UIButton = {
        let paperButton = UIButton(frame: CGRect(origin: .zero, size: .init(width: 224, height: 55)))
        paperButton.setTitle("🤚🏿", for: .normal)
        paperButton.backgroundColor = .systemGray3
        paperButton.addAction(UIAction() { [weak self] _ in
            self?.paperButtonAction()
        }, for: .touchUpInside)
        paperButton.layer.cornerRadius = 20
        paperButton.translatesAutoresizingMaskIntoConstraints = false
        return paperButton
    }()
    
    private lazy var scissorsButton: UIButton = {
        let scissorsButton = UIButton(frame: CGRect(origin: .zero, size: .init(width: 224, height: 55)))
        scissorsButton.setTitle("✌🏿", for: .normal)
        scissorsButton.backgroundColor = .systemGray3
        scissorsButton.addAction(UIAction() { [weak self] _ in
            self?.scissorsButtonAction()
        }, for: .touchUpInside)
        scissorsButton.layer.cornerRadius = 20
        scissorsButton.translatesAutoresizingMaskIntoConstraints = false
        return scissorsButton
    }()
    
    private lazy var languageSwitch: UISwitch = {
        let languageSwitch = UISwitch(frame: CGRect(x: 300, y: 150, width: 0, height: 0))
        languageSwitch.setOn(true, animated: true)
        languageSwitch.addTarget(self, action: #selector(actionLanguage(paramTarget:)), for: .valueChanged)
       // languageSwitch.translatesAutoresizingMaskIntoConstraints = false
        return languageSwitch
    }()
    
    private lazy var drawSwitch: UISwitch = {
        let drawSwitch = UISwitch(frame: CGRect(x: 300, y: 250, width: 0, height: 0))
        drawSwitch.setOn(true, animated: true)
        drawSwitch.addTarget(self, action: #selector(actionDraw(paramTarget:)), for: .valueChanged)
       // drawSwitch.translatesAutoresizingMaskIntoConstraints = false
        return drawSwitch
    }()
    
    private lazy var restartButton: UIButton = {
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
        paperButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scissorsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        paperButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 475).isActive = true
        scissorsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 520).isActive = true
        restartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true

        
        rockButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        rockButton.widthAnchor.constraint(equalToConstant: 224).isActive = true
        
        paperButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        paperButton.widthAnchor.constraint(equalToConstant: 224).isActive = true
        
        scissorsButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        scissorsButton.widthAnchor.constraint(equalToConstant: 224).isActive = true
        
        restartButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        restartButton.widthAnchor.constraint(equalToConstant: 224).isActive = true
        
        
        ResultLabel.center = view.center
    }
    
}

private extension RockPaperScissorsController {
    
    @objc func actionLanguage(paramTarget: UISwitch) {
        if languageSwitch.isOn {
            languageLabel.text = "Ru"
        } else {
            languageLabel.text = "En"
        }
    }
    
    @objc func actionDraw(paramTarget: UISwitch) {
        if drawSwitch.isOn {
            drawLabel.text = "Draw on"
        } else {
            drawLabel.text = "Draw off"
        }
    }

    func setupView() {
        
        view.addSubview(nameOfGame)
            nameOfGame.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
            nameOfGame.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.backgroundColor = .white
        
        
        view.addSubview(rockButton)
        view.addSubview(paperButton)
        view.addSubview(scissorsButton)
        view.addSubview(restartButton)
    }
    
    func setupNavigationBarIfPossible() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let button = UIButton()
        button.setImage(
            UIImage(systemName: "gearshape.fill",
                    withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)),
            for: .normal)
        button.imageView?.tintColor = .black
        button.addAction(UIAction() { [weak self] _ in
            self?.routeToModalSheet()
        }, for: .touchUpInside)
        navigationItem.rightBarButtonItems = [ UIBarButtonItem(customView: button) ]
    }
    
    func rockButtonAction() {
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        let randomChoice = Int.random(in: 0...2)
        switch randomChoice {
        case 0:
            if drawSwitch.isOn {
            if languageSwitch.isOn {
            ResultLabel.text = "Ньчья, Ваш выбор - Камень, \nпротивник выбрал Камень!"
            } else {
            ResultLabel.text = "Draw, you chose Rock, \nopponent chose Rock!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemGray3
            } else {
                rockButtonAction()
            }
        case 1:
            if languageSwitch.isOn {
                ResultLabel.text = "Вы победили! Ваш выбор - Камень \nпротивник выбрал Ножницы!"
            } else {
                ResultLabel.text = "You win, you chose Rock, \nopponent chose Scissors!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemGreen
        case 2:
            if languageSwitch.isOn {
                ResultLabel.text = "Вы проиграли! Ваш выбор - Камень \nпротивник выбрал Бумагу!"
            } else {
            ResultLabel.text = "You lose, you chose Rock, \nopponent chose Paper!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemRed
        default:
            ResultLabel.text = ""
        }
        ResultLabel.isHidden = false
        view.addSubview(ResultLabel)
        restartButton.isHidden = false
        view.addSubview(restartButton)
    }
    
    func paperButtonAction() {
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        let randomChoice = Int.random(in: 0...2)
        switch randomChoice {
        case 0:
            if languageSwitch.isOn {
                ResultLabel.text = "Вы победили, Ваш выбор - Бумага, \nпротивник выбрал Камень!"
            } else {
                ResultLabel.text = "You win, you chose Paper, \nopponent chose Rock!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemGreen
        case 1:
            if languageSwitch.isOn {
                ResultLabel.text = "Вы проиграли, Ваш выбор - Бумага, \nпротивник выбрал Ножницы!"
            } else {
                ResultLabel.text = "You lose, you chose Paper, \nopponent chose Scissors!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemRed
        case 2:
            if drawSwitch.isOn {
            if languageSwitch.isOn {
                ResultLabel.text = "Ньчья, Ваш выбор - Бумага, \nпротивник выбрал Бумагу!"
            } else {
                ResultLabel.text = "Draw, you chose Paper, \nopponent chose Paper!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemGray3
            } else {
                paperButtonAction()
            }
        default:
            ResultLabel.text = ""
        }
        ResultLabel.isHidden = false
        view.addSubview(ResultLabel)
        restartButton.isHidden = false
        view.addSubview(restartButton)
    }
    
    func scissorsButtonAction() {
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        let randomChoice = Int.random(in: 0...2)
        switch randomChoice {
        case 0:
            if languageSwitch.isOn {
                ResultLabel.text = "Вы проиграли, Ваш выбор - Ножницы, \nпротивник выбрал Камень!"
            } else {
                ResultLabel.text = "You lose, you chose Scissors, \nopponent chose Rock!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemRed
        case 1:
            if drawSwitch.isOn {
            if languageSwitch.isOn {
                ResultLabel.text = "Ньчья, Ваш выбор - Ножницы, \nпротивник выбрал Ножницы!"
            } else {
                ResultLabel.text = "Draw, you chose Scissors, \nopponent chose Scissors!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemGray3
            } else {
                scissorsButtonAction()
            }
        case 2:
            if languageSwitch.isOn {
                ResultLabel.text = "Вы победили, Ваш выбор - Ножницы, \nпротивник выбрал Бумагу!"
            } else {
                ResultLabel.text = "You win, you chose Scissors, \nopponent chose Paper!"
            }
            ResultLabel.numberOfLines = 2
            view.backgroundColor = .systemGreen
        default:
            ResultLabel.text = ""
        }
        ResultLabel.isHidden = false
        view.addSubview(ResultLabel)
        restartButton.isHidden = false
        view.addSubview(restartButton)
    }
    
    func routeToModalSheet() {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        present(vc, animated: true)
        vc.view.addSubview(languageSwitch)
        vc.view.addSubview(languageLabel)
        vc.view.addSubview(drawSwitch)
        vc.view.addSubview(drawLabel)
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
