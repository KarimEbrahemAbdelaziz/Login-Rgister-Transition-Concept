//
//  ViewController.swift
//  AuthTransitionConcept
//
//  Created by Karim Ebrahem on 2/23/18.
//  Copyright © 2018 Karim Ebrahem. All rights reserved.
//

import UIKit
import IBAnimatable

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loginView: AnimatableView!
    @IBOutlet weak var registerView: AnimatableView!
    
    @IBOutlet weak var loginFormView: AnimatableView!
    @IBOutlet weak var registerFormView: AnimatableView!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initialSetup()
    }
    
    func initialSetup() {
        viewSetup()
        gesturesSetup()
    }
    
    func viewSetup() {
        loginConstraint.constant = self.view.frame.width - (16+16+16+67)
        loginButtonConstraint.constant = self.view.frame.width - 32
        self.registerLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
    
    func gesturesSetup() {
        loginView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginTapped)))
        registerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerTapped)))
    }
    
    @objc func loginTapped() {
        UIView.animate(withDuration: 0.3) {
            self.loginFormView.alpha = 1.0
            self.registerFormView.alpha = 0.0
            
            self.loginConstraint.constant = self.view.frame.width - (16+16+16+67)
            self.loginButtonConstraint.constant = self.view.frame.width - 32
            
            self.loginLabel.transform = CGAffineTransform(rotationAngle: 0)
            self.registerLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            
            self.view.layoutIfNeeded()
        }
        
        self.contentConstraint.constant = 130
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func registerTapped() {
        UIView.animate(withDuration: 0.3) {
            self.loginFormView.alpha = 0.0
            self.registerFormView.alpha = 1.0
            
            self.loginConstraint.constant = 67
            self.loginButtonConstraint.constant = 0
            
            self.loginLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            self.registerLabel.transform = CGAffineTransform(rotationAngle: 0)
            
            self.view.layoutIfNeeded()
        }
        
        self.contentConstraint.constant = 310
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

