//
//  HomeUITests.swift
//  BeerDataUITests
//
//  Created by Óscar on 19/2/23.
//

import XCTest

final class HomeUITests: XCTestCase {
    
    private var sut: XCUIApplication!

    override func setUpWithError() throws {
        sut = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testNavigationTitleShouldBeBeers() {
        // Arrange
        let navigationBar = sut.navigationBars["Beers"]
        
        // Act
        sut.launch()
        
        // Assert
        XCTAssertTrue(navigationBar.exists)
    }
    
}
