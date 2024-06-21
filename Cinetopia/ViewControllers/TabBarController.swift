//
//  TabBarController.swift
//  Cinetopia
//
//  Created by Paulo Andres on 21/06/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - Class methods
    
    private func setupTabBarController() {
        let home = UINavigationController(rootViewController: MoviesViewController())
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes populares"
        
        let favorites = UINavigationController(rootViewController: FavoriteMoviesViewController())
        
        let heartSymbol = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        favorites.tabBarItem.image = heartSymbol
        favorites.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home, favorites], animated: true)
    }
}
