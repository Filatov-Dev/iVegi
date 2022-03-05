//
//  RecipeDetailedViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 21.02.2022.
//

import UIKit

final class RecipeDetailedViewController: UIViewController {

    private var recipe: Recipe? //{
//        didSet {
//            if oldValue != recipe {
//                updateView()
//            }
//        }
//    }

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
            title = recipe.title
        }

//        navigationController?.navigationBar.isTranslucent = false

        view.backgroundColor = UIColor(named: "BackGroundColor")
        navigationController?.view.backgroundColor = view.backgroundColor


//        navigationController?.navigationBar.backgroundColor = .green
    }

    override func loadView() {

        let recipeDetailedView = RecipeDetailedView()
//        let gestureRecognizer = UIGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
//        recipeDetailedView.source.addGestureRecognizer(UIGestureRecognizer)

        view = recipeDetailedView
     }

    func updateView() {
        if let recipe = recipe {
            (view as! RecipeDetailedView).setup(with: recipe)
        }
    }
}
