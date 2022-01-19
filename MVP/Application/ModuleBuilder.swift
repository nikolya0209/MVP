//
//  ModuleBuilder.swift
//  MVP
//
//  Created by MacBookPro on 17.01.2022.
//

import UIKit


protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        
        return view
    }
}
