//
//  HomeViewModelTests.swift
//  BeerDataTests
//
//  Created by Óscar on 19/2/23.
//

import XCTest
@testable import BeerData

@MainActor final class HomeViewModelTests: XCTestCase {
    
    private var sut: HomeViewModel!
    private let firstBeer = BeerModelElement(id: 1, name: "Fake Beer", tagline: "Fake beer 1 tagline", description: "Fake beer 1 tagline", imageURL: "https://images.punkapi.com/v2/keg.png", ingredients: Ingredients(malt: [Malt(name: "Caramal"), Malt(name: "Munich")]))

    override func setUpWithError() throws {
        sut = HomeViewModel()
        sut.service = BeersServiceMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFetchBeersShouldGetBeers() {
        // Arrange
        let expectation = expectation(description: "Fetch beers from service")
        var actualResult = BeerModel()
        
        // Act
        sut.fetchBeers { result in
            guard let unwrappedResult = try? result.get() else {return}
            actualResult = unwrappedResult
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
        // Arrange
        XCTAssertFalse(actualResult.isEmpty)
    }
    
    func testFetchBeersShouldGetBeersSorted() {
        // Arrange
        let expectation = expectation(description: "Fetch beers from service")
        var expectedResult = BeerModel()
        expectedResult.append(firstBeer)
        var actualResult = BeerModel()
        
        // Act
        sut.fetchBeers { result in
            guard let unwrappedResult = try? result.get() else {return}
            actualResult = unwrappedResult
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
        // Arrange
        XCTAssertEqual(expectedResult[0], actualResult[0])
    }
    
     func testSaveGoalsShouldSaveItInUserDefaults() {
        // Arrange
        let expectation = expectation(description: "Fetch beers from service")
        
        // Act
        sut.fetchBeers(completion: { result in
            guard let unwrappedResult = try? result.get() else {return}
            self.sut.beers = unwrappedResult
            expectation.fulfill()
        })
         sut.getBeers()
        
        waitForExpectations(timeout: 3.0, handler: nil)
        
        // Assert
        XCTAssertNotNil(sut.beers)
    }
    
    func testGetIngredientsStringShouldTransformIngredientsToString() {
        // Act
        let expectedResult = " Caramal, Munich"
        let actualResult = sut.getIngredientsString(from: firstBeer.ingredients)
        
        // Assert
        XCTAssertEqual(expectedResult,actualResult)
    }

}
