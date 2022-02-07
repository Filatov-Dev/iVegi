//
//  Recipe.swift
//  iVegi
//
//  Created by Павел Барташов on 06.02.2022.
//

import UIKit

struct Recipe {
    let title: String
    let ingredients: [Ingredient]
    let image: UIImage
    let description: String
    let source: String
    let calories: UInt
    let lengthInMinutes: UInt
    let steps: [String]
}
