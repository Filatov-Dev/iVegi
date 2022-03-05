//
//  RecipeDetailedViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 21.02.2022.
//

import UIKit

final class RecipeDetailedViewController: UIViewController {

    private var recipe: Recipe?

    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()

        if let recipe = recipe {
            navigationItem.title = recipe.title
        }

        view.backgroundColor = UIColor(named: "BackGroundColor")
        navigationController?.view.backgroundColor = view.backgroundColor
    }

    override func loadView() {

        view = RecipeDetailedView()
     }

    func updateView() {
        if let recipe = recipe {
            (view as! RecipeDetailedView).setup(with: recipe)
        }
    }
}
