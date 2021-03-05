//
//  ShowingHeroesFlowFactory.swift
//  HeroesMVP
//
//  Created by Damir Lutfullin on 05.03.2021.
//

import UIKit

struct ShowingHeroesFlowFactory {
    
    static func makeHeroListScreen(delegate: ListHeroPresenterDelegate) -> StartHeroView {
        let mainHeroViewController = StartHeroView()
        let presenter = ListHeroPresenter(view: mainHeroViewController, delegate: delegate)
        mainHeroViewController.heroPresenter = presenter
        return mainHeroViewController
    }
    
    static func makeDetailHeroScreen(hero: Hero) -> DetailHeroViewController {
        let view = DetailHeroViewController()
        let presenter = DetailHeroPresenter(view: view, hero: hero)
        view.presenter = presenter
        return view
    }
}
