//
//  SettingsController.swift
//  firstApp
//
//  Created by Admin on 4/26/22.
//

import UIKit

final class SettingsController: UIViewController {
    
    public var languageLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 100, y: 150, width: 80, height: 30))
        label.text = "Ru"
       // label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var drawLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 100, y: 250, width: 80, height: 30))
        label.text = "Draw on"
       // label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var languageSwitch: UISwitch = {
        let languageSwitch = UISwitch(frame: CGRect(x: 300, y: 150, width: 0, height: 0))
        languageSwitch.setOn(true, animated: true)
        languageSwitch.addTarget(self, action: #selector(actionLanguage(paramTarget:)), for: .valueChanged)
       // languageSwitch.translatesAutoresizingMaskIntoConstraints = false
        return languageSwitch
    }()
    
    public lazy var drawSwitch: UISwitch = {
        let drawSwitch = UISwitch(frame: CGRect(x: 300, y: 250, width: 0, height: 0))
        drawSwitch.setOn(true, animated: true)
        drawSwitch.addTarget(self, action: #selector(actionDraw(paramTarget:)), for: .valueChanged)
       // drawSwitch.translatesAutoresizingMaskIntoConstraints = false
        return drawSwitch
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(languageSwitch)
        view.addSubview(languageLabel)
        view.addSubview(drawSwitch)
        view.addSubview(drawLabel)
        
        // Do any additional setup after loading the view.
    }
    
    

}

extension SettingsController {
    
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
}

