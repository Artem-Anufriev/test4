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
    var model : Model?
    var presenter : Presenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = Model()
        self.presenter = Presenter(with: model!)
    }
    
    @IBAction func checkLoginButton(_ sender: UIButton) {
        guard let login = loginTextField.text else {
            return
        }
        self.model = self.presenter?.checkLogin(with: login)
        updateLoginLabel()
    }
    
    private func updateLoginLabel() {
        checkLoginLabel.text = self.model?.message
    }
}

