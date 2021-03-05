//
//  ShowingHeroesCoordinator.swift
//  HeroesMVP
//
//  Created by Damir Lutfullin on 03.03.2021.
//

import UIKit

class ShowingHeroesFlowCoordinator: Coordinator {
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHeroesList()
    }
    
    private func showHeroesList() {
        let heroListView = ShowingHeroesFlowFactory.makeHeroListScreen(delegate: self)
        navigationController.pushViewController(heroListView, animated: false)
    }
    
    private func showDetailHeroScreen(hero: Hero) {
        let detailHeroScreen = ShowingHeroesFlowFactory.makeDetailHeroScreen(hero: hero)
        navigationController.pushViewController(detailHeroScreen, animated: true)
    }
}

//MARK: ListHeroPresenterDelegate
extension ShowingHeroesFlowCoordinator: ListHeroPresenterDelegate {
    func didSelectedHero(hero: Hero) {
        showDetailHeroScreen(hero: hero)
    }
}

