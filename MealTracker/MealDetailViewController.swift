//
//  MealDetailViewController.swift
//  MealTracker
//
//  Created by Татьяна on 05.10.2018.
//  Copyright © 2018 Татьяна. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    var meal: Meal?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextView()
        
        if let meal = meal {
            update(meal)
        }
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapRecognizer)
        nameTextField.delegate = self
        noteTextView.delegate = self
    }
    
    func configureTextView() {
        noteTextView.layer.borderWidth = 0.15
        noteTextView.layer.borderColor = UIColor.gray.cgColor
        noteTextView.layer.cornerRadius = 6
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func update(_ meal: Meal) {
        nameTextField.text = meal.name
        photoImageView.image = meal.photo
        noteTextView.text = meal.notes
        ratingControl.rating = meal.rating
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        timestampLabel.text = dateFormatter.string(from: meal.timestamp)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender as! UIBarButtonItem) === saveButton {
            meal?.name = nameTextField.text!
            meal?.notes = noteTextView.text!
            meal?.rating = ratingControl.rating
        }
    }

    
}

extension MealDetailViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            hideKeyboard()
            return false
        }
        return true
    }
}
