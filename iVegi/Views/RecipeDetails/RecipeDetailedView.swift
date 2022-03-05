//
//  RecipeDetailedView.swift
//  iVegi
//
//  Created by Павел Барташов on 21.02.2022.
//

import UIKit

final class RecipeDetailedView: UIView {

    private enum K {
        static let spacing: CGFloat = 10.0
        static let prefixSource = "Source: "
    }

    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.setContentHuggingPriority(.init(999), for: .vertical)
        return image
    }()

    private var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
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

    private var ingredients: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = K.spacing
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()

    private var recipeDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()

    private var source: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        return textView
    }()

    private var instructions: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = K.spacing
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()

    init() {
        super.init(frame: .zero)

        Initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        Initialize()
    }

    func Initialize() {

        let rootScrollView = UIScrollView()
        let rootStack = UIStackView()

        rootStack.axis = .vertical
        rootStack.spacing = K.spacing
        rootStack.alignment = .fill
        rootStack.distribution = .fill

        let caloriesAndMinutesStack = UIStackView(arrangedSubviews: [calories, minutes])

        caloriesAndMinutesStack.axis = .horizontal
        caloriesAndMinutesStack.spacing = K.spacing
        caloriesAndMinutesStack.alignment = .fill
        caloriesAndMinutesStack.distribution = .fillEqually

        let headArea = createAreaView(for: [image, title, caloriesAndMinutesStack])
        rootStack.addArrangedSubview(headArea)

        let ingredientsTitle = UILabel()
        ingredientsTitle.text = "Ingredients"
        ingredientsTitle.font = .preferredFont(forTextStyle: .title2)

        let ingredientsArea = createAreaView(for: [ingredientsTitle, ingredients])
        rootStack.addArrangedSubview(ingredientsArea)

        let descriptionArea = createAreaView(for: [recipeDescription])
        rootStack.addArrangedSubview(descriptionArea)

        let instructionTitle = UILabel()
        instructionTitle.text = "Instructions"
        instructionTitle.font = .preferredFont(forTextStyle: .title2)

        let instructionsArea = createAreaView(for: [instructionTitle, instructions])
        rootStack.addArrangedSubview(instructionsArea)

        let sourceArea = createAreaView(for: [source])
        rootStack.addArrangedSubview(sourceArea)

        rootScrollView.addSubview(rootStack)

        addSubview(rootScrollView)

        rootScrollView.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            rootScrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            rootScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rootScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rootScrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])

        rootStack.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            rootStack.topAnchor.constraint(equalTo: rootScrollView.topAnchor),
            rootStack.leadingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.leadingAnchor),
            rootStack.trailingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.trailingAnchor),
            rootStack.bottomAnchor.constraint(equalTo: rootScrollView.bottomAnchor),
            rootStack.widthAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.widthAnchor)
        ])

        image.translatesAutoresizingMaskIntoConstraints = false;

        let imageHeightConstraint = image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.62)
        imageHeightConstraint.priority = .init(999)

        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: headArea.layoutMarginsGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: headArea.layoutMarginsGuide.trailingAnchor),
            imageHeightConstraint
        ])

//DEBUGG
//        title.backgroundColor = .yellow
//        image.backgroundColor = .green
//        calories.backgroundColor = .blue
//        minutes.backgroundColor = .gray
//        rootScrollView.backgroundColor = .gray
//        rootStack.backgroundColor = .purple
//        ingredients.backgroundColor = .yellow
//        instructions.backgroundColor = .yellow
//        backgroundColor = .orange
//        rootScrollView.backgroundColor = #colorLiteral(red: 0.7098039216, green: 0.9960784314, blue: 0.5137254902, alpha: 1)
    }

    func createAreaView(for array: [UIView]) -> UIView {

        let area = UIView()
        area.layer.cornerRadius = 10
        area.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor

        area.layer.shadowRadius = 4.0
        area.layer.shadowOpacity = 1.0
        area.layer.shadowOffset = CGSize(width: 4, height: 4)
        area.layer.shouldRasterize = true
        area.layer.rasterizationScale = UIScreen.main.scale

        area.backgroundColor = UIColor(named: "BackGroundColor")

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = K.spacing
        stack.alignment = .fill
        stack.distribution = .fill

        array.forEach {
            stack.addArrangedSubview($0)
        }

        area.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: area.layoutMarginsGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: area.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: area.layoutMarginsGuide.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: area.layoutMarginsGuide.bottomAnchor)
        ])

        return area
    }

    func setup(with recipe: Recipe) {
        image.image = recipe.image
        title.text = recipe.title
        minutes.text = "\(recipe.lengthInMinutes) min"
        calories.text = "\(recipe.calories) cal"
        recipeDescription.text = recipe.description

        fillIngredients(with: recipe.ingredients)
        fillInstructions(with: recipe.instructions)

        let attributedString = NSMutableAttributedString(string: "\(K.prefixSource)\(recipe.source)")

        attributedString.addAttribute(.link, value: recipe.source, range: NSRange(location: K.prefixSource.count, length: recipe.source.count))

        source.attributedText = attributedString
    }

    func fillIngredients(with array:[Ingredient]) {

        ingredients.subviews.forEach { $0.removeFromSuperview() }

        array.forEach {
            let ingredientView = IngredientView()
            ingredientView.setup(with: $0)
            ingredients.addArrangedSubview(ingredientView)
        }
    }

    func fillInstructions(with array:[String]) {
        instructions.subviews.forEach { $0.removeFromSuperview() }

        for item in array.enumerated() {
            let instructionView = InstructionView()
            instructionView.setup(with: "\(item.element)", number: item.offset + 1)
            instructions.addArrangedSubview(instructionView)
        }
    }
}
