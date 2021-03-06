//
//  RecipeViewCell.swift
//  iVegi
//
//  Created by Павел Барташов on 13.02.2022.
//

import UIKit

final class RecipeCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "RecipeCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var minutes: UILabel!

    func setup(with recipe: Recipe) {
        image.image = recipe.image
        title.text = recipe.title
        minutes.text = "\(recipe.lengthInMinutes) min"
//        calories.text = recipe.calories > 0 ? "\(recipe.calories) cal" : ""
        calories.text = "\(recipe.calories) cal"
    }
}
