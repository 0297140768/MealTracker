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
            Meal(name: "fruit salad", photo: UIImage(named: "Salat1")!, notes: "fresh fruits", rating: 1, timestamp: dateFormatter.date(from: "2018-10-01")!),
            Meal(name: "salad", photo: UIImage(named: "Salat2")!, notes: "vegetable slicing", rating: 2, timestamp: dateFormatter.date(from: "2018-10-01")!),
            Meal(name: "curd", photo: UIImage(named: "Tvorog")!, notes: "cottage cheese with sour cream", rating: 3, timestamp: dateFormatter.date(from: "2018-10-01")!)
        ]
        
        return meals
    }
    
}
