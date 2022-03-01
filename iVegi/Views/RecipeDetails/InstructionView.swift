//
//  InstructionView.swift
//  iVegi
//
//  Created by Павел Барташов on 26.02.2022.
//

import UIKit

class InstructionView: UIStackView {

    private enum K {
        static let spacing: CGFloat = 10.0
    }

    private var number: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0 // Если 1, то возникает проблема ambiguous width
        label.setContentHuggingPriority(.init(1000), for: .horizontal)
        return label
    }()

    private var instruction: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0

        label.setContentHuggingPriority(.init(1), for: .horizontal)
        return label
    }()

    init() {
        super.init(frame: .zero)

        Initialize()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        Initialize()
    }

    func Initialize() {

//        let stack = self

//        let mark = UIImageView(image: UIImage(systemName: "staroflife"))
//        addSubview(mark)

//        addSubview(title)

        self.axis = .horizontal
        self.spacing = K.spacing
        self.alignment = .top
        self.distribution = .fill

        //        title.setContentHuggingPriority(.defaultLow, for: .horizontal)

        [self.number,
         self.instruction].forEach { self.addArrangedSubview($0) }

//        addSubview(stack)

//        mark.translatesAutoresizingMaskIntoConstraints = false;
//
//        NSLayoutConstraint.activate([
//            mark.topAnchor.constraint(equalTo: topAnchor),
//            mark.leadingAnchor.constraint(equalTo: leadingAnchor),
//            mark.widthAnchor.constraint(equalTo: mark.heightAnchor),
//            mark.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//
//        title.translatesAutoresizingMaskIntoConstraints = false;
//
//        NSLayoutConstraint.activate([
//            title.topAnchor.constraint(equalTo: topAnchor),
//            title.leadingAnchor.constraint(equalTo: mark.trailingAnchor),
//            title.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//
//        stack.translatesAutoresizingMaskIntoConstraints = false;
//
//        NSLayoutConstraint.activate([
//            stack.topAnchor.constraint(equalTo: topAnchor),
//            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])





//        backgroundColor = .cyan
//        number.backgroundColor = .orange
//        instruction.backgroundColor = .systemPink


    }

    func setup(with instruction: String, number: Int) {
        self.number.text = "\(number)."
        self.instruction.text = instruction

//        setNeedsLayout()

     }
}
