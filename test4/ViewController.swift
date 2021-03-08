//
//  ViewController.swift
//  test4
//
//  Created by Artem on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var checkLoginButton: UIButton!
    var checkingLogin: CheckingLogin!
    
    @IBAction func checkLogin(_ sender: UIButton) {
        guard let loginText = loginTextField.text else { return }
        checkingLogin = CheckingLogin(withLogin: loginText)
        if let isValid = checkingLogin.isValid {
            let alertController = loginAlert(flag: isValid)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func loginAlert(flag valid : Bool) -> UIAlertController {
        let message = (valid ? "this is a valid login" : "this is an invalid login")
        let ac = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        ac.addAction(okAction)
        return ac
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

