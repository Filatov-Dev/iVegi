//
//  ViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 05.02.2022.
//

import UIKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func Initialize() -> UIViewController {
        tabBar.tintColor = .systemGreen

        let recipeViewController = RecipeViewController()
        recipeViewController.tabBarItem = UITabBarItem(title: "Recipes",
                                                       image: UIImage(systemName: "text.book.closed.fill"),
                                                       tag: 0)
        recipeViewController.view.backgroundColor = UIColor(named: "BackGroundColor")

        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        favoriteViewController.view.backgroundColor = UIColor(named: "BackGroundColor")

        let shoppingListViewController = RecipeDetailedViewController(recipe: DataModel().getRecipe(at: 0))
        shoppingListViewController.tabBarItem = UITabBarItem(title: "Shopping list",
                                                             image: UIImage(systemName: "bag.fill"),
                                                             tag: 2)
        shoppingListViewController.view.backgroundColor = UIColor(named: "BackGroundColor")

        let moreViewController = UIViewController()
        moreViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        moreViewController.view.backgroundColor = UIColor(named: "BackGroundColor")

        setViewControllers([UINavigationController(rootViewController: recipeViewController),
                            UINavigationController(rootViewController: favoriteViewController),
                            shoppingListViewController,
                            moreViewController], animated: true)

        selectedIndex = 1


        return self
    }
}
