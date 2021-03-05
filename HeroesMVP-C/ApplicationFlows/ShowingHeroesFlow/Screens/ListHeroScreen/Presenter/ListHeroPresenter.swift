//
//  Presenter.swift
//  SwiftBook_2_HomeWork10.1
//
//  Created by Damir Lutfullin on 13.10.2020.
//

import UIKit


protocol ListHeroPresenterDelegate {
    func didSelectedHero(hero: Hero)
}

protocol ListHeroPresenterProtocol: class {
    func setHeroesForView()
    func setFilteredHeroes(searchQuery: String)
    func showDetailView(hero: Hero)
}

final class ListHeroPresenter: ListHeroPresenterProtocol {
   
    private weak var heroView: StartHeroViewProtocol!
    private var task: URLSessionTask?
    private var filteredHeroes: [Hero]?
    private var delegate: ListHeroPresenterDelegate
    private var heroes: [Hero]?
    
    init(view: StartHeroViewProtocol?, delegate: ListHeroPresenterDelegate) {
        self.heroView = view
        self.delegate = delegate
    }
    
    func setHeroesForView() {
        NetworkManager.shared.downloadHeroes { [weak self] (result) in
            switch result {
            case .success(let heroes):
                self?.heroes = heroes
                self?.heroView.showHeroes(heroes: heroes)
            case .failure(let error):
                self?.heroView.showError(error: error)
            }
        }
    }
    
    func setFilteredHeroes(searchQuery: String) {
        self.filteredHeroes = heroes?.filter({ (hero) -> Bool in
            return hero.name.contains(searchQuery)
        })
        heroView.showHeroes(heroes: filteredHeroes)
    }
    
    func showDetailView(hero: Hero) {
        delegate.didSelectedHero(hero: hero)
    }
}
