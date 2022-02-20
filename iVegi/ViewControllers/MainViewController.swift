//
//  ViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 05.02.2022.
//

import UIKit

final class MainViewController: UITabBarController {
    
    private var tester = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func Initialize() -> UIViewController {
        tabBar.tintColor = .systemGreen

        let recipeViewController = RecipeViewController()
        recipeViewController.tabBarItem = UITabBarItem(title: "Recipes",
                                                       image: UIImage(systemName: "text.book.closed.fill"),
                                                       tag: 0)
        recipeViewController.view.backgroundColor = .white

        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        favoriteViewController.view.backgroundColor = .white

        let shoppingListViewController = UITableViewController()
        shoppingListViewController.tabBarItem = UITabBarItem(title: "Shopping list",
                                                             image: UIImage(systemName: "bag.fill"),
                                                             tag: 2)
        shoppingListViewController.view.backgroundColor = .yellow

        let moreViewController = UIViewController()
        moreViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
        moreViewController.view.backgroundColor = .white

        setViewControllers([recipeViewController,
                            favoriteViewController,
                            shoppingListViewController,
                            moreViewController], animated: true)

        return self
    }
}
