//
//  Recipe.swift
//  RecipeBook
//
//  Created by Mac on 19/6/25.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let id_user: UUID

    let name: String
    let durationCooking: Float
    let evaluate: Float
    let country: String
    let circleThumbnail: String
    let squareThumbnail: String
    
    let createdAt: Date
}
