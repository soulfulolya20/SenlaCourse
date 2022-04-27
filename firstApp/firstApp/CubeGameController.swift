//
//  CubeGameController.swift
//  firstApp
//
//  Created by Admin on 3/30/22.
//

import UIKit

final class CubeGameController: UIViewController {
    
   private var cubeLabel1: UILabel = {
        let label = UILabel()
        label.text = "1️⃣"
        label.isHidden = false
        return label
    }()
    
   private var cubeLabel2: UILabel = {
        let label = UILabel()
        label.text = "2️⃣"
        label.isHidden = false
        return label
    }()
    
   private var cubeLabel3: UILabel = {
        let label = UILabel()
        label.text = "3️⃣"
        label.isHidden = false
        return label
    }()
    
   private var cubeLabel4: UILabel = {
        let label = UILabel()
        label.text = "4️⃣"
        label.isHidden = false
        return label
    }()
    
   private var cubeLabel5: UILabel = {
        let label = UILabel()
        label.text = "5️⃣"
        label.isHidden = false
        return label
    }()
    
   private var cubeLabel6: UILabel = {
        let label = UILabel()
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
        restartButton.isHidden = true
        return restartButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLayoutSubviews()
        makeConstraints()

        setupView()
    }
    
    override func viewDidLayoutSubviews() {
//        cubeLabel1.frame(forAlignmentRect: CGRect(x: 154, y: 250, width: 80, height: 80))
//        cubeLabel2.frame(forAlignmentRect: CGRect(x: 224, y: 250, width: 80, height: 80))
//        cubeLabel3.frame(forAlignmentRect: CGRect(x: 154, y: 285, width: 80, height: 80))
//        cubeLabel4.frame(forAlignmentRect: CGRect(x: 224, y: 285, width: 80, height: 80))
//        cubeLabel5.frame(forAlignmentRect: CGRect(x: 154, y: 320, width: 80, height: 80))
//        cubeLabel6.frame(forAlignmentRect: CGRect(x: 224, y: 320, width: 80, height: 80))
    }

}

private extension CubeGameController {
    
    private func makeConstraints() {
        cubeLabel1.translatesAutoresizingMaskIntoConstraints = false
        cubeLabel2.translatesAutoresizingMaskIntoConstraints = false
        cubeLabel3.translatesAutoresizingMaskIntoConstraints = false
        cubeLabel4.translatesAutoresizingMaskIntoConstraints = false
        cubeLabel5.translatesAutoresizingMaskIntoConstraints = false
        cubeLabel6.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 475),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 475),
            
            startButton.heightAnchor.constraint(equalToConstant: 36),
            startButton.widthAnchor.constraint(equalToConstant: 224),
            
            restartButton.heightAnchor.constraint(equalToConstant: 36),
            restartButton.widthAnchor.constraint(equalToConstant: 224),
            
            cubeLabel1.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            cubeLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 154),
            
            cubeLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            cubeLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 224),
            
            cubeLabel3.topAnchor.constraint(equalTo: view.topAnchor, constant: 285),
            cubeLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 154),
            
            cubeLabel4.topAnchor.constraint(equalTo: view.topAnchor, constant: 285),
            cubeLabel4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 224),
            
            cubeLabel5.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            cubeLabel5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 154),
            
            cubeLabel6.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            cubeLabel6.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 224)
        ])
    }
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(cubeLabel1)
        view.addSubview(cubeLabel2)
        view.addSubview(cubeLabel3)
        view.addSubview(cubeLabel4)
        view.addSubview(cubeLabel5)
        view.addSubview(cubeLabel6)
        view.addSubview(startButton)
        view.addSubview(restartButton)
        
        
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
