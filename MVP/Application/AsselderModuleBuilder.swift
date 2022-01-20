//
//  ModuleBuilder.swift
//  MVP
//
//  Created by MacBookPro on 17.01.2022.
//

import UIKit


protocol AsselderBuilderProtocol {
    func createMainModule(roruter: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, roruter: RouterProtocol) -> UIViewController
}

class AsselderModuleBuilder: AsselderBuilderProtocol {
    
    func createMainModule(roruter: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService, router: roruter)
        view.presenter = presenter
        return view
    }
    func createDetailModule(comment: Comment?, roruter: RouterProtocol) -> UIViewController {
        let networkService = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: roruter, comment: comment)
        view.presenter = presenter
        return view
    }
    
}
