//
//  RecipeDetailedViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 21.02.2022.
//

import UIKit

final class RecipeDetailedViewController: UIViewController {

    var recipe: Recipe? {
        didSet {
//            if oldValue != recipe {
                updateView()
//            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
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
