//
//  RecipeViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 12.02.2022.
//

import UIKit

final class RecipeViewController: UIViewController {

    private var db = DataModel()

    private let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "What do we search?"

        navigationItem.title = "Vegan recipes"
        navigationItem.searchController = searchController

        definesPresentationContext = true
    }

    override func loadView() {

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

        collectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier)

        collectionView.dataSource = self
        collectionView.delegate = self

        view = collectionView
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

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        collectionView.deselectItem(at: indexPath, animated: true)

        let recipe = db.getRecipe(at: indexPath.row)
        let recipeDetailedViewController = RecipeDetailedViewController(recipe: recipe)
        //        showDetailViewController(recipeDetailedViewController, sender: self)
        navigationController?.pushViewController(recipeDetailedViewController, animated: true)
    }
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

// MARK: - UISearchResultsUpdating method

extension RecipeViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
            //            filterContent(for: searchText)
            // Reload the table view with the search result data.
            //            tableView.reloadData()
        }
    }
}
