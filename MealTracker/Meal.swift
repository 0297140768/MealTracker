//
//  Meal.swift
//  MealTracker
//
//  Created by Татьяна on 05.10.2018.
//  Copyright © 2018 Татьяна. All rights reserved.
//

import Foundation
import UIKit

struct Meal {
    var name: String
    var photo: UIImage
    var notes: String
    var rating: Int
    var timestamp: Date
    
    static func firstLoad() -> [Meal] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let meals = [
            Meal(name: "Burger", photo: UIImage(named: "burger")!, notes: "King burger", rating: 5, timestamp: dateFormatter.date(from: "2018-10-01")!),
            Meal(name: "Salad", photo: UIImage(named: "salat")!, notes: "vegetable slicing", rating: 2, timestamp: dateFormatter.date(from: "2018-10-01")!),
            Meal(name: "Chicken", photo: UIImage(named: "chicken")!, notes: "chicken with sour cream", rating: 3, timestamp: dateFormatter.date(from: "2018-10-01")!),
            Meal(name: "Пельмени", photo: UIImage(named: "pelmeni")!, notes: "With sour cream", rating: 5, timestamp: dateFormatter.date(from: "2018-01-01")!),
            Meal(name: "Picca", photo: UIImage(named: "picca")!, notes: "Big round picca", rating: 3, timestamp: dateFormatter.date(from: "2018-10-01")!),
            Meal(name: "Scrambled eggs", photo: UIImage(named: "scrambled_eggs")!, notes: "Scrambled big white eggs", rating: 3, timestamp: dateFormatter.date(from: "2018-10-01")!)

        ]
        
        return meals
    }
    
}
