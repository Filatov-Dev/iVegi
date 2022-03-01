//
//  IngredientView.swift
//  iVegi
//
//  Created by Павел Барташов on 23.02.2022.
//

import UIKit

class IngredientView: UIView {

    private enum K {
        static let spacing: CGFloat = 10.0
    }
    
    private var title = UILabel()

    private var amount: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()

    private var piece: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
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

        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = K.spacing
        stack.alignment = .fill
        stack.distribution = .fillEqually

        let mark = UIImageView(image: UIImage(systemName: "checkmark.square"))
        mark.tintColor = .systemGreen
        addSubview(mark)

        addSubview(title)


//        title.setContentHuggingPriority(.defaultLow, for: .horizontal)

        [self.amount,
         self.piece].forEach { stack.addArrangedSubview($0) }

        addSubview(stack)



        mark.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            mark.topAnchor.constraint(equalTo: topAnchor),
            mark.leadingAnchor.constraint(equalTo: leadingAnchor),
            mark.widthAnchor.constraint(equalTo: mark.heightAnchor),
            mark.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        title.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: mark.trailingAnchor, constant: layoutMargins.left),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        stack.translatesAutoresizingMaskIntoConstraints = false;

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: title.trailingAnchor),
            stack.widthAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 5),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])





//        backgroundColor = .cyan
//        title.backgroundColor = .orange
//        amount.backgroundColor = .systemPink
//        piece.backgroundColor = .green

    }

    func setup(with ingredient: Ingredient) {
        title.text = ingredient.title
       // let format = ingredient.amount == Float(Int(ingredient.amount))
//        amount.text = String(format: "%.0F", ingredient.amount)
        amount.text = String(format: "%.1F", ingredient.amount)
        piece.text = ingredient.piece.rawValue
     }
}
