//
//  DetailHeroPresenter.swift
//  SwiftBook_2_HomeWork10.1
//
//  Created by Damir Lutfullin on 19.10.2020.
//

import Foundation

protocol DetailHeroPresenterProtocol: AnyObject {
    func setHero()
}

final class DetailHeroPresenter: DetailHeroPresenterProtocol {
    
    private weak var view: DetailHeroViewProtocol?
    private var hero: Hero
    
    init(view: DetailHeroViewProtocol, hero: Hero) {
        self.hero = hero
        self.view = view
    }
    
    func setHero() {
        view?.showInfo(hero: hero)
        let imageString = hero.images.lg
        NetworkManager.shared.downloadImage(urlString: imageString) { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.view?.showImage(dataForImage: data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


