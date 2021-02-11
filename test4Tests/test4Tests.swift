//
//  test4Tests.swift
//  test4Tests
//
//  Created by Artem on 11.02.2021.
//

import XCTest
@testable import test4

class test4Tests: XCTestCase {
    
    var sutLogin: Login!
    var sutViewController: ViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginInit() throws {
        let login = "info@yandex.ru"
        sutLogin = Login(withLogin: login)
        XCTAssert(sutLogin.login == login, "Login.login must be equals login")
        XCTAssertNotNil(sutLogin.login, "sutLogin.login must be not nil")
        XCTAssertNotNil(sutLogin.isValid, "sutLogin.isValid must be not nil")
    }
    
    func testIfLoginValid() throws {
        let login = "info--yandex.ru22"
        sutLogin = Login(withLogin: login)
        let isValid = sutLogin.isValid!
        XCTAssertTrue(isValid, "login \(login) must be valid")
    }
    
    func testIfLoginInvalid() throws {
        let login = "2info--yandex.ru22"
        sutLogin = Login(withLogin: login)
        let isValid = sutLogin.isValid!
        XCTAssertFalse(isValid, "login \(login) must be invalid")
    }
    
    func testLoginAlertIfTrue() throws {
        sutViewController = ViewController()
        let sutAlertController = sutViewController.loginAlert(flag: true)
        XCTAssertNotNil(sutAlertController,"sutAlertController must be not nil")
    }
    
    func testLoginAlertIfFalse() throws {
        sutViewController = ViewController()
        let sutAlertController = sutViewController.loginAlert(flag: false)
        XCTAssertNotNil(sutAlertController,"sutAlertController must be not nil")
    }
    
    func testVCCheckLogin() throws {
        sutViewController = ViewController()
        let sutTextField = UITextField()
        let sutButton = UIButton()
        let login = "2info--yandex.ru22"
        sutTextField.text = login
        sutViewController.loginTextField = sutTextField
        sutViewController.checkLogin(sutButton)
        XCTAssertNotNil(sutViewController.login.isValid, "sutViewController.login.isValid must be not nil")
        XCTAssertNotNil(sutViewController.login.login, "sutViewController.login.login must be not nil")
        XCTAssert(sutViewController.login.login == login, "sutLogin.login must be equals login")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
