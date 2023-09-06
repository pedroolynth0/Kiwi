//
//  Receita.swift
//  Kiwi
//
//  Created by dti digital on 30/08/23.
//

import Foundation


struct Recipe{

    var name: String
    var category: String
    var description: String
    var image: String
    var steps: [String]
    var ingredients: [String]
    var difficulty: String
    var time: String
    
    init(name: String, category: String,description: String, image: String, steps: [String], ingredients: [String], difficulty: String, time: String) {
        self.name = name
        self.category = category
        self.description = description
        self.image = image
        self.steps = steps
        self.ingredients = ingredients
        self.difficulty = difficulty
        self.time = time
    }
    var uniqueID: String {
        return UUID().uuidString
    }
}

