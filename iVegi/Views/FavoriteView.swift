////
////  FavoriteView.swift
////  iVegi
////
////  Created by Павел Барташов on 17.02.2022.
////
//
//import UIKit
//
//final class FavoriteView: UIView {
//
//    private enum K {
//        static let spacing: CGFloat = 10.0
//    }
//
//    private(set) var searchField = UITextField()
//    private(set) var tableView = UITableView()
//
//    init() {
//        super.init(frame: .zero)
//
//        Initialize()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        Initialize()
//    }
//
//    func Initialize() {
//
//        let rootStack = UIStackView()
//
//        addSubview(rootStack)
//
//        rootStack.axis = .vertical
//        rootStack.spacing = K.spacing
//        rootStack.alignment = .fill
//        rootStack.distribution = .fill
//
//        [self.searchField,
//         self.tableView].forEach { rootStack.addArrangedSubview($0) }
//
//        rootStack.translatesAutoresizingMaskIntoConstraints = false;
//
//        NSLayoutConstraint.activate([
//            rootStack.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 5),
//            rootStack.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
//            rootStack.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
//            rootStack.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
//        ])
//    }
//}
