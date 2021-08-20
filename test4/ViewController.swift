//
//  ViewController.swift
//  test4
//
//  Created by Artem on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var checkLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
}

extension ViewController: UITextFieldDelegate {
    
    @objc private func textFieldChanged() {
        guard let loginText = loginTextField.text else { return }
        let checkingLogin = Validator(withLogin: loginText)
        if checkingLogin.isValid! {
            checkLoginLabel.textColor = .blue
            checkLoginLabel.text = "this is a valid login"
        } else {
            checkLoginLabel.textColor = .red
            checkLoginLabel.text = "this is an invalid login"
        }
    }
    
}
