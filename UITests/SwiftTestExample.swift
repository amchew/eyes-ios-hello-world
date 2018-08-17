//
//  SwiftTestExample.swift
//  UITests
//
//  Created by Anton Chuev on 5/2/18.
//  Copyright © 2018 Applitools. All rights reserved.
//

import XCTest

class SwiftTestExample: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Initialize the eyes SDK and set your private API key.
        let eyes = Eyes()
        
        eyes.apiKey = "iVcxz102wB7fwTuXt97dVJKNSyVoTgwfgeizsHGRKmqAuw110"
        
        // Start the test.
        eyes.open(withApplicationName: "Hello World!", testName: "My first test using EyesXCUI SDK!")
        
        // Visual checkpoint #1.
        eyes.check(withTag: "Hello", andSettings: Target.window().timeout(inSeconds: 5))
        
        // Click the "Click me!" button.
        XCUIApplication().buttons["Click me!"].tap()
        
        // Visual checkpoint #2.
        eyes.checkWindow(withTag: "Click!")
        
        // End the test.
        do {
            try eyes.close()
        } catch {
            eyes.abortIfNotClosed()
        }
    }
    
}
