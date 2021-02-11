//
//  Login.swift
//  test4
//
//  Created by Artem on 11.02.2021.
//

import Foundation

struct Login {
    
    let loginRegExp = "(?=^.{3,32}$)([A-Za-z][A-Za-z0-9\\.\\-]*@[A-Za-z0-9\\.\\-]+\\.[A-Za-z]{2,6}|[A-Za-z][A-Za-z0-9\\.\\-]+)"
    var login: String?
    var isValid: Bool?
    
    func isValidLogin(login: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", loginRegExp).evaluate(with: login)
    }
    
    init(withLogin login : String) {
        self.login = login
        self.isValid = isValidLogin(login: login)
    }
}

