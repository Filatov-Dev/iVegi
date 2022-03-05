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
        label.setContentHuggingPriority(.init(999), for: .horizontal)
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

        self.axis = .horizontal
        self.spacing = K.spacing
        self.alignment = .top
        self.distribution = .fill

        [self.number,
         self.instruction].forEach { self.addArrangedSubview($0) }

//DEBUGG
//        backgroundColor = .cyan
//        number.backgroundColor = .orange
//        instruction.backgroundColor = .systemPink
    }

    func setup(with instruction: String, number: Int) {
        self.number.text = "\(number)."
        self.instruction.text = instruction
     }
}
