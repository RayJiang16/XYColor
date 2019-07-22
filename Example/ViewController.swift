//
//  ViewController.swift
//  Example
//
//  Created by RayJiang on 2019/7/18.
//  Copyright © 2019 RayJiang. All rights reserved.
//

import UIKit
import XYColor

class ViewController: UIViewController {
    
    private lazy var color1: UIColor = {
        return UIColor { (traitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return .yellow
            } else {
                return .green
            }
        }
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(type: .custom)
        view.frame = CGRect(x: UIScreen.main.bounds.width/2-100, y: 100, width: 200, height: 40)
        view.setTitle("Change mode", for: .normal)
        view.setTitleColor(UIColor.label, for: .normal)
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.setLayerBorderColor(UIColor.label)
        view.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: UIScreen.main.bounds.width/2-50, y: 160, width: 100, height: 40)
        view.text = "Text"
        view.textAlignment = .center
        view.textColor = UIColor.label
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.setLayerBorderColor(color1)
        return view
    }()
    
    private lazy var layer1: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 15, y: 230, width: 80, height: 80)
        layer.cornerRadius = 4
        layer.setBackgroundColor(color1, with: view)
        return layer
    }()
    
    private lazy var layer2: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: UIScreen.main.bounds.width/2-40, y: 230, width: 80, height: 80)
        layer.cornerRadius = 4
        layer.borderWidth = 10
        layer.setBackgroundColor(color1, with: view)
        layer.setBorderColor(UIColor.label, with: view)
        return layer
    }()
    
    private lazy var layer3: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: UIScreen.main.bounds.width-80-15, y: 230, width: 80, height: 80)
        layer.cornerRadius = 4
        layer.shadowRadius = 20
        layer.shadowOpacity = 1
        layer.setShadowColor(color1, with: view)
        layer.setBackgroundColor(UIColor.label, with: view)
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(button)
        view.addSubview(label)
        view.layer.addSublayer(layer1)
        view.layer.addSublayer(layer2)
        view.layer.addSublayer(layer3)
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
        scene.window?.overrideUserInterfaceStyle = view.traitCollection.userInterfaceStyle == .dark ? .light : .dark
    }
}

