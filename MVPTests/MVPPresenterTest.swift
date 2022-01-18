//
//  MVPPresenterTest.swift
//  MVPTests
//
//  Created by MacBookPro on 18.01.2022.
//

import XCTest
@testable import MVP

class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class MVPPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    
    override func setUpWithError() throws {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
        view = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "is not nil")
        XCTAssertNotNil(person, "is not nil")
        XCTAssertNotNil(presenter, "is not nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }

    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }
    
}
