//
//  RecipeViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 12.02.2022.
//

import UIKit

final class RecipeViewController: UIViewController {

    private var db = DataModel()

    private var searchField = UITextField()
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier)
        
        collectionView.reloadData()
    }

    override func loadView() {
        view = UIView()
  
        // searchField
        view.addSubview(searchField)
        searchField.placeholder = "What do we search?"
        searchField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 5),
            searchField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            searchField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            searchField.heightAnchor.constraint(equalToConstant: 20)
        ])

        // collectionView
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        // Layout constraints for `collectionView`
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension RecipeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return db.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier, for: indexPath) as! RecipeCollectionViewCell

        cell.setup(with: db.getRecipe(at: indexPath.row))

        return cell
    }
}


extension RecipeViewController: UICollectionViewDelegateFlowLayout {

    private enum LayoutConstant {
        static let sectionInsets = UIEdgeInsets(
                                        top: 20.0,
                                        left: 20.0,
                                        bottom: 40.0,
                                        right: 20.0)

        static let itemsPerRow: CGFloat = 2
    }

//    private enum LayoutConstant {
//        static let spacing: CGFloat = 16.0
//        static let itemHeight: CGFloat = 300.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let side = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
//
//        return CGSize(width: side, height: side)
//    }
//
//    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
//        let itemsInRow: CGFloat = 2
//
//        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
//        let finalWidth = (width - totalSpacing) / itemsInRow
//
//        return finalWidth
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return LayoutConstant.spacing
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return LayoutConstant.spacing
//    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let paddingSpace = LayoutConstant.sectionInsets.left * (LayoutConstant.itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / LayoutConstant.itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {

        return LayoutConstant.sectionInsets
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {

        return LayoutConstant.sectionInsets.left
    }
}

extension RecipeViewController: UICollectionViewDelegate {

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
 return true
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
 return true
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
 return false
 }

 override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
 return false
 }

 override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

 }
 */
}
