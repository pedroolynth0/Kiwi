//
//  RecipeError.swift
//  Kiwi
//
//  Created by dti digital on 16/02/24.
//

import Foundation


enum RecipeError: Error {
    case recipeNotFound
    case recipeAlreadyExists
    case invalidRecipeData(reason: String)
    case databaseError(error: Error)
    case permissionDenied
    case saveFailure(reason: String)
    case loadFailure(reason: String)
    case updateFailure(reason: String)
    case deleteFailure(reason: String)
    case unknownError
}

