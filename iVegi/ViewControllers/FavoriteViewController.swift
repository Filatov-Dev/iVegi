//
//  FavoriteViewController.swift
//  iVegi
//
//  Created by Павел Барташов on 15.02.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

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

        let tableView = UITableView()

        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.reuseIdentifier)

        tableView.dataSource = self
        tableView.delegate = self

        view = tableView
    }
}

// MARK: - Table view data source

extension FavoriteViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return db.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.reuseIdentifier, for: indexPath) as! RecipeTableViewCell

        cell.setup(with: db.getRecipe(at: indexPath.row))

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}

// MARK: - Table view delegate

extension FavoriteViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let recipe = db.getRecipe(at: indexPath.row)
        let recipeDetailedViewController = RecipeDetailedViewController(recipe: recipe)
//        showDetailViewController(recipeDetailedViewController, sender: self)
        navigationController?.pushViewController(recipeDetailedViewController, animated: true)
    }
}

// MARK: - UISearchResultsUpdating method

extension FavoriteViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        // If the search bar contains text, filter our data with the string
        if let searchText = searchController.searchBar.text {
//            filterContent(for: searchText)
            // Reload the table view with the search result data.
//            tableView.reloadData()
        }
    }
}
