//
//  MainPresenter.swift
//  MVP
//
//  Created by MacBookPro on 16.01.2022.
//

import Foundation

protocol MainViewProtocol: class {
    func setGreeting(greeting: String)
}
protocol MainPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainPresenterProtocol {
   
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
}

