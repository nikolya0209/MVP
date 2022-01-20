//
//  DetailPresenter.swift
//  MVP
//
//  Created by MacBookPro on 19.01.2022.
//

import Foundation

protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {
   
    var comment: Comment?
    var router: RouterProtocol?
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
}
