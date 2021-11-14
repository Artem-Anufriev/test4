//
//  Model.swift
//  test4
//
//  Created by Artem on 14.11.2021.
//

import Foundation

class Model {
    
    let validator = Validator()
    var message: String = ""
    
    func checkLogin(with login: String) {
        if validator.isValidLogin(with: login) {
            self.message = "this is valid login"
        }
        else {
            self.message = "this is invalid login"
        }
    }
}
