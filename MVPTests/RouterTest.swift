//
//  RouterTest.swift
//  MVPTests
//
//  Created by MacBookPro on 21.01.2022.
//

import XCTest
@testable import MVP

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AsselderModuleBuilder()
    
    override func setUpWithError() throws {
        
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }

    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }

}
