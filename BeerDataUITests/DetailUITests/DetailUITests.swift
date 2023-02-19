//
//  DetailUITests.swift
//  BeerDataUITests
//
//  Created by Óscar on 19/2/23.
//

import XCTest

final class DetailUITests: XCTestCase {

    private var sut: XCUIApplication!

    override func setUpWithError() throws {
        sut = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDetailShouldReturnToBeersList() {
        // Arrange
        let navigationBar = sut.navigationBars["Beers"]
        
        // Act
        sut.launch()
        let anyBeer = sut.collectionViews.buttons.firstMatch
        anyBeer.tap()
        let backButton = sut.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Beers"]
        backButton.tap()
        
        // Act
        sut.launch()
        
        // Assert
        XCTAssertTrue(navigationBar.exists)
    }
}
