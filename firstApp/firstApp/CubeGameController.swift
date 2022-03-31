//
//  CubeGameController.swift
//  firstApp
//
//  Created by Admin on 3/30/22.
//

import UIKit

class CubeGameController: UIViewController {
    
    var cubeLabel1: UILabel! = {
        let label = UILabel(frame: CGRect(x: 154, y: 250, width: 80, height: 80))
        label.text = "1️⃣"
        label.isHidden = false
        return label
    }()
    
    var cubeLabel2: UILabel! = {
        let label = UILabel(frame: CGRect(x: 224, y: 250, width: 80, height: 80))
        label.text = "2️⃣"
        label.isHidden = false
        return label
    }()
    
    var cubeLabel3: UILabel! = {
        let label = UILabel(frame: CGRect(x: 154, y: 285, width: 80, height: 80))
        label.text = "3️⃣"
        label.isHidden = false
        return label
    }()
    
    var cubeLabel4: UILabel! = {
        let label = UILabel(frame: CGRect(x: 224, y: 285, width: 80, height: 80))
        label.text = "4️⃣"
        label.isHidden = false
        return label
    }()
    
    var cubeLabel5: UILabel! = {
        let label = UILabel(frame: CGRect(x: 154, y: 320, width: 80, height: 80))
        label.text = "5️⃣"
        label.isHidden = false
        return label
    }()
    
    var cubeLabel6: UILabel! = {
        let label = UILabel(frame: CGRect(x: 224, y: 320, width: 80, height: 80))
        label.text = "6️⃣"
        label.isHidden = false
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = .systemCyan
        startButton.addAction(UIAction() { [weak self] _ in
            self?.startAction()
        }, for: .touchUpInside)
        startButton.layer.cornerRadius = 20
       startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
    }()
    
    private lazy var restartButton: UIButton = {
        let restartButton = UIButton()
        restartButton.setTitle("Restart", for: .normal)
        restartButton.backgroundColor = .systemGray2
        restartButton.addAction(UIAction() { [weak self] _ in
            self?.restartAction()
        }, for: .touchUpInside)
        restartButton.layer.cornerRadius = 20
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.isHidden = true
        return restartButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
    }

}

private extension CubeGameController {
    func setupView() {
        view?.addSubview(cubeLabel1)
        view?.addSubview(cubeLabel2)
        view?.addSubview(cubeLabel3)
        view?.addSubview(cubeLabel4)
        view?.addSubview(cubeLabel5)
        view?.addSubview(cubeLabel6)
        view.addSubview(startButton)
        view.addSubview(restartButton)
        restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 475).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        restartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 475).isActive = true
        
        startButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 224).isActive = true
        
        restartButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        restartButton.widthAnchor.constraint(equalToConstant: 224).isActive = true
    }
    
    func startAction() {
        let randomResult = Int.random(in: 0...5)
        
        switch randomResult {
        case 0:
            cubeLabel2.isHidden = true
            cubeLabel3.isHidden = true
            cubeLabel4.isHidden = true
            cubeLabel5.isHidden = true
            cubeLabel6.isHidden = true
            
        case 1:
            cubeLabel1.isHidden = true
            cubeLabel3.isHidden = true
            cubeLabel4.isHidden = true
            cubeLabel5.isHidden = true
            cubeLabel6.isHidden = true
        case 2:
            cubeLabel2.isHidden = true
            cubeLabel1.isHidden = true
            cubeLabel4.isHidden = true
            cubeLabel5.isHidden = true
            cubeLabel6.isHidden = true
        case 3:
            cubeLabel2.isHidden = true
            cubeLabel3.isHidden = true
            cubeLabel1.isHidden = true
            cubeLabel5.isHidden = true
            cubeLabel6.isHidden = true
        case 4:
            cubeLabel2.isHidden = true
            cubeLabel3.isHidden = true
            cubeLabel4.isHidden = true
            cubeLabel1.isHidden = true
            cubeLabel6.isHidden = true
        case 5:
            cubeLabel2.isHidden = true
            cubeLabel3.isHidden = true
            cubeLabel4.isHidden = true
            cubeLabel5.isHidden = true
            cubeLabel1.isHidden = true
        default:
            cubeLabel1.isHidden = false
            cubeLabel2.isHidden = false
            cubeLabel3.isHidden = false
            cubeLabel4.isHidden = false
            cubeLabel5.isHidden = false
            cubeLabel6.isHidden = false
        }
        
        startButton.isHidden = true
        restartButton.isHidden = false
        
    }
    
    func restartAction() {
        restartButton.isEnabled = true
        restartButton.isHidden = true
        startButton.isHidden = false
        cubeLabel1.isHidden = false
        cubeLabel2.isHidden = false
        cubeLabel3.isHidden = false
        cubeLabel4.isHidden = false
        cubeLabel5.isHidden = false
        cubeLabel6.isHidden = false
    }
    
}
