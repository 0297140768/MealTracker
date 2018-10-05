//
//  MealListTableViewController.swift
//  MealTracker
//
//  Created by Татьяна on 05.10.2018.
//  Copyright © 2018 Татьяна. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    var meals: [Meal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meals list"

        loadMeals()
    }

    
    func loadMeals() {
        meals = Meal.firstLoad()
    }
    
    func saveMeals() {
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell
        
        cell.mealImage.image = meals[indexPath.row].photo
        cell.mealLabel.text = meals[indexPath.row].name
        cell.mealRating.rating = meals[indexPath.row].rating

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMeal = meals[indexPath.row]
        performSegue(withIdentifier: "ShowDetail", sender: selectedMeal)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail",
           let meal = sender as? Meal {
                let detailVC = segue.destination as! MealDetailViewController
                detailVC.meal = meal
        }
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealDetailViewController {
            if let selectedIndexPath = tableView.indexPathForSelectedRow,
                let meal = sourceViewController.meal {
                meals[selectedIndexPath.row] = meal
                saveMeals()
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
        }
    }
  

}
