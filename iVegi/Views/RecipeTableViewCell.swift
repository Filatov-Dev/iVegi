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

    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return image
    }()

    private var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.setContentCompressionResistancePriority(.init(999), for: .vertical)
        return label
    }()

    private var calories: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()

    private var minutes: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .secondaryLabel
      return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        Initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        Initialize()
    }

    func Initialize() {

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
            rootStack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            rootStack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            rootStack.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])

        image.translatesAutoresizingMaskIntoConstraints = false;

        let imageHeightConstraint = image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.62)
        imageHeightConstraint.priority = .init(999)

        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            image.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor, multiplier: 0.3),
            imageHeightConstraint
        ])

//DEBUGG
//        title.backgroundColor = .yellow
//        image.backgroundColor = .green
//        calories.backgroundColor = .blue
//        minutes.backgroundColor = .gray
//        contentView.backgroundColor = .orange
//        rootStack.backgroundColor = .red
    }

    func setup(with recipe: Recipe) {
        image.image = recipe.image
        title.text = recipe.title
        minutes.text = "\(recipe.lengthInMinutes) min"
        //        calories.text = recipe.calories > 0 ? "\(recipe.calories) cal" : ""
        calories.text = "\(recipe.calories) cal"
    }
}
