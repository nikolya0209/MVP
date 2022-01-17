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
        let model = Person(firstName: "Nick", lastName: "Jun")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        
        return view
    }
}
