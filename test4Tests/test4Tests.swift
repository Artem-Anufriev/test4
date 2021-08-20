//
//  test4Tests.swift
//  test4Tests
//
//  Created by Artem on 11.02.2021.
//

import XCTest
@testable import test4

class test4Tests: XCTestCase {
    
    override func setUpWithError() throws {
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testValidator() {
        let validEmails = [
            "info@mail.ru",
            "info-222@mail.ru",
            "info.222@mail.ru",
            "info-222@corp.mail.ru",
            "info-222@mail222.ru",
            "info-222@mail-222.ru",
            "info@corp.222.mail.ru",
            "info.222@mail.ru.com",
            "info.222-333@mail.ru",
            "info.222.333-444@mail-mail.2.ru",
        ]
        validEmails.forEach { (login) in
            let checkingLogin = Validator(withLogin: login)
            let response = checkingLogin.isValid
            XCTAssertEqual(response, true, "Login \(login) must be valid")
        }
        let invalidEmails = [
            "3info@mail.ru",
            "info-222@mail.ru.222",
            "info.222@@mail.ru",
            "info/222@corp.mail.ru",
            "info-222@mail222",
            "info-222@.mail-222.ru",
            ".info@corp.222.mail.ru",
            "-info.222@mail.ru.222",
            "@info.222-333@mail.ru",
            "info.222.333-444@.mail-mail.2.ru",
        ]
        invalidEmails.forEach { (login) in
            let checkingLogin = Validator(withLogin: login)
            let response = checkingLogin.isValid
            XCTAssertEqual(response, false, "Login \(login) must be invalid")
        }
        let validLogins = [
            "inf",
            "in012345678901234567890123456789",
            "infomail.ru",
            "info-222mail.ru",
            "info.222mail.ru",
            "info-222corp.mail.ru",
            "info-222mail222.ru",
            "info-222mail-222.ru",
            "infocorp.222.mail.ru",
            "info.222mail.ru.com",
            "info.222-333mail.ru",
            "info.222.333-444mail-mail.2.ru",
        ]
        validLogins.forEach { (login) in
            let checkingLogin = Validator(withLogin: login)
            let response = checkingLogin.isValid
            XCTAssertEqual(response, true, "Login \(login) must be valid")
        }
        let invalidLogins = [
            "3infomail.ru",
            "in",
            "i",
            "i3",
            "-info-222mail222.ru",
            "+info-222mail-222.ru",
            "infoco+rp.222.mail.ru",
            "info.22)(2mail.ru.com",
            "a123456789012345678901234567890aaa",
            "info.222.]333-444mail-mail.2.ru",
        ]
        invalidLogins.forEach { (login) in
            let checkingLogin = Validator(withLogin: login)
            let response = checkingLogin.isValid
            XCTAssertEqual(response, false, "Login \(login) must be invalid")
        }

    }
    
}
