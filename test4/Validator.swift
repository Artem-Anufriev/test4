//
//  Validator.swift
//  test4
//
//  Created by Artem on 11.02.2021.
//

import Foundation

class Validator {
   
    func isValidLogin(with login: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", loginRegExpression).evaluate(with: login)
    }
    
}

