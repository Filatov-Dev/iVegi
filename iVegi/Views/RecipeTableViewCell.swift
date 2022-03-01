//
//  RecipeTableViewCell.swift
//  iVegi
//
//  Created by Павел Барташов on 16.02.2022.
//

import UIKit

final class RecipeTableViewCell: UITableViewCell {

    private enum K {
        static let spacing: CGFloat = 10.0
    }

    static let reuseIdentifier = "RecipeCell"

    private var image = UIImageView()
    private var title = UILabel()
    private var calories = UILabel()
    private var minutes = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        Initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        Initialize()
    }

    func Initialize() {

        title.numberOfLines = 0

        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .vertical)

        calories.textColor = .secondaryLabel

        minutes.textAlignment = .right
        minutes.textColor = .secondaryLabel

//        title.backgroundColor = .yellow
//        image.backgroundColor = .green
//        calories.backgroundColor = .blue
//        minutes.backgroundColor = .gray
//        contentView.backgroundColor = .orange

        let caloriesAndMinutesStack = UIStackView(arrangedSubviews: [calories, minutes])

        caloriesAndMinutesStack.axis = .horizontal
        caloriesAndMinutesStack.spacing = K.spacing
        caloriesAndMinutesStack.alignment = .fill
        caloriesAndMinutesStack.distribution = .fillEqually

        let textStack = UIStackView(arrangedSubviews: [title, caloriesAndMinutesStack])

        textStack.axis = .vertical
        textStack.spacing = K.spacing
        textStack.alignment = .fill
        textStack.distribution = .fill

        let rootStack = UIStackView(arrangedSubviews: [image, textStack])

        rootStack.axis = .horizontal
        rootStack.spacing = K.spacing
        rootStack.alignment = .fill
        rootStack.distribution = .fill

        contentView.addSubview(rootStack)

        rootStack.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            rootStack.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            rootStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rootStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rootStack.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])

        image.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.3)
        ])
    }

    func setup(with recipe: Recipe) {
        image.image = recipe.image
        title.text = recipe.title
        minutes.text = "\(recipe.lengthInMinutes) min"
        //        calories.text = recipe.calories > 0 ? "\(recipe.calories) cal" : ""
        calories.text = "\(recipe.calories) cal"
    }
}
