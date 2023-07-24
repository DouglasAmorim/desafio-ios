//
//  desafio_iosUITests.swift
//  desafio-iosUITests
//
//  Created by Douglas Amorim on 22/07/23.
//

import XCTest

final class desafio_iosUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        sleep(15)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFilterNavigation_TextField() throws {
        app.navigationBars.buttons["Filter"].tap()
        
        let textField = app.textFields["NAME_TEXT_FIELD"]
            
        XCTAssertTrue(textField.waitForExistence(timeout: 1))
                textField.tap()
        textField.typeText("RICK \n")
        
        app.toolbars.buttons["Done"].tap()
        
        let filterPredicate = NSPredicate(format: "label beginswith 'FILTER'")
        app.buttons.element(matching: filterPredicate).tap()
        
        sleep(10)
        
        app.navigationBars.buttons["Cancel"].tap()
    }
    
    func testFilterNavigation() throws {
        app.navigationBars.buttons["Filter"].tap()
        
        let alivePredicate = NSPredicate(format: "label beginswith 'alive'")
        app.staticTexts.matching(alivePredicate).element.tap()
        
        let filterPredicate = NSPredicate(format: "label beginswith 'FILTER'")
        app.buttons.element(matching: filterPredicate).tap()
        
        sleep(10)
        
        app.navigationBars.buttons["Cancel"].tap()
    }
    
    func testNavigation() throws {
        let predicate = NSPredicate(format: "label beginswith 'Rick Sanchez'")
        app.staticTexts.matching(predicate).element.tap()

        app.navigationBars.buttons["Characters"].tap()
        app.navigationBars.buttons["Filter"].tap()
        app.navigationBars.buttons["Characters"].tap()
    }
}
