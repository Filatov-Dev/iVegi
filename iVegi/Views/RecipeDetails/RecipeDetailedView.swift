//
//  RecipeDetailedView.swift
//  iVegi
//
//  Created by Павел Барташов on 21.02.2022.
//

import UIKit

//TODO Make final inherite from UIScrollView???
class RecipeDetailedView: UIView {

    private enum K {
        static let spacing: CGFloat = 10.0
        static let prefixSource = "Source: "
    }

    private var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.setContentHuggingPriority(.init(999), for: .vertical)
        //        image.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .vertical)
        return image
    }()

    private var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)

        //        title.layer.shadowColor = UIColor.black.cgColor
        //        title.layer.shadowRadius = 3.0
        //        title.layer.shadowOpacity = 1.0
        //        title.layer.shadowOffset = CGSize(width: 4, height: 4)
        //        title.layer.masksToBounds = false
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
//        textView.font = .preferredFont(forTextStyle: .headline)
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

//        backgroundColor = .white
        let rootScrollView = UIScrollView()
        let rootStack = UIStackView()

        rootStack.axis = .vertical
        rootStack.spacing = K.spacing
        rootStack.alignment = .fill
        rootStack.distribution = .fill


//        rootStack.addArrangedSubview(image)
//        rootStack.addArrangedSubview(title)

        let caloriesAndMinutesStack = UIStackView(arrangedSubviews: [calories, minutes])

        caloriesAndMinutesStack.axis = .horizontal
        caloriesAndMinutesStack.spacing = K.spacing
        caloriesAndMinutesStack.alignment = .fill
        caloriesAndMinutesStack.distribution = .fillEqually

//        rootStack.addArrangedSubview(caloriesAndMinutesStack)
        let headArea = createAreaView(for: [image, title, caloriesAndMinutesStack])
        rootStack.addArrangedSubview(headArea)

        let ingredientsTitle = UILabel()
        ingredientsTitle.text = "Ingredients"
        ingredientsTitle.font = .preferredFont(forTextStyle: .title2)
//        rootStack.addArrangedSubview(ingredientsTitle)

//        rootStack.addArrangedSubview(ingredients)
        let ingredientsArea = createAreaView(for: [ingredientsTitle, ingredients])
        rootStack.addArrangedSubview(ingredientsArea)

        let descriptionArea = createAreaView(for: [recipeDescription])
        rootStack.addArrangedSubview(descriptionArea)
//        rootStack.addArrangedSubview(recipeDescription)

        let instructionTitle = UILabel()
        instructionTitle.text = "Instructions"
        instructionTitle.font = .preferredFont(forTextStyle: .title2)

        let instructionsArea = createAreaView(for: [instructionTitle, instructions])
        rootStack.addArrangedSubview(instructionsArea)
//        rootStack.addArrangedSubview(instructions)

//        let sourceTextLabel = UILabel()
//        sourceTextLabel.text = "Source:"
//        sourceTextLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

//        let sourceStack = UIStackView(arrangedSubviews: [source])
//
//        sourceStack.axis = .horizontal
//        sourceStack.spacing = K.spacing
//        sourceStack.alignment = .fill
//        sourceStack.distribution = .fill

        let sourceArea = createAreaView(for: [source])
        rootStack.addArrangedSubview(sourceArea)
//        rootStack.addArrangedSubview(source)

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

//        caloriesAndMinutesStack.translatesAutoresizingMaskIntoConstraints = false;

//        NSLayoutConstraint.activate([
//            caloriesAndMinutesStack.leadingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.leadingAnchor),
//            caloriesAndMinutesStack.trailingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.trailingAnchor)
//        ])
//
//        ingredients.translatesAutoresizingMaskIntoConstraints = false;
//
//        NSLayoutConstraint.activate([
//            ingredients.leadingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.leadingAnchor),
//            ingredients.trailingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.trailingAnchor)
//        ])
//
//        instructions.translatesAutoresizingMaskIntoConstraints = false;
//
//        NSLayoutConstraint.activate([
//            instructions.leadingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.leadingAnchor),
//            instructions.trailingAnchor.constraint(equalTo: rootScrollView.layoutMarginsGuide.trailingAnchor)
//        ])



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

//    func createAreaView(for array: [UIView]) -> UIStackView {
//        let area = UIStackView()
//        area.layer.cornerRadius = 10
//        area.backgroundColor = .white
//        area.clipsToBounds = true
//
//        area.axis = .vertical
//        area.spacing = K.spacing
//        area.alignment = .fill
//        area.distribution = .fill
//
//        array.forEach {
//            area.addArrangedSubview($0)
//        }
//
//        insetsLayoutMarginsFromSafeArea = true
//
//        return area
//    }

    func createAreaView(for array: [UIView]) -> UIView {

        let area = UIView()
        area.layer.cornerRadius = 10
        area.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
//        area.layer.shadowColor = UIColor.systemGreen.cgColor

        area.layer.shadowRadius = 4.0
        area.layer.shadowOpacity = 1.0
        area.layer.shadowOffset = CGSize(width: 4, height: 4)
//        area.layer.masksToBounds = false
        area.layer.shouldRasterize = true
        area.layer.rasterizationScale = UIScreen.main.scale

        area.backgroundColor = UIColor(named: "BackGroundColor")
//        area.clipsToBounds = true

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
        //        calories.text = recipe.calories > 0 ? "\(recipe.calories) cal" : ""
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
