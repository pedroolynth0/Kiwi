//
//  Receita.swift
//  Kiwi
//
//  Created by dti digital on 30/08/23.
//


import SwiftUI


struct Recipe: Codable{

    var _id : String
    var name: String
    var category: String
    var description: String
    var image: String?
    var steps: [String]
    var ingredients: [String]
    var difficulty: String
    var time: String
    var meal: String
    
    init( _id : String, name: String, category: String,description: String, image: String, steps: [String], ingredients: [String], difficulty: String, time: String, meal: String) {
        self._id = _id
        self.name = name
        self.category = category
        self.description = description
        self.image = image
        self.steps = steps
        self.ingredients = ingredients
        self.difficulty = difficulty
        self.time = time
        self.meal = meal
    }
    var uniqueID: String {
        return UUID().uuidString
    }
}

