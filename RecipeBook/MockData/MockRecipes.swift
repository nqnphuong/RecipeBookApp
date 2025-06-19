//
//  MockRecipes.swift
//  RecipeBook
//
//  Created by Mac on 19/6/25.
//

import Foundation

let mockRecipes: [Recipe] = [
    Recipe(
        id_user: mockUsers[0].id,
        name: "Classic Greek Salad",
        durationCooking: 15,
        evaluate: 4.5,
        country: "Greece",
        circleThumbnail: "greek_circle",
        squareThumbnail: "greek_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[1].id,
        name: "Crunchy Nut Coleslaw",
        durationCooking: 20,
        evaluate: 3.5,
        country: "USA",
        circleThumbnail: "coleslaw_circle",
        squareThumbnail: "coleslaw_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[2].id,
        name: "Shrimp Chicken Andouille Sausage Jambalaya",
        durationCooking: 50,
        evaluate: 3.0,
        country: "USA",
        circleThumbnail: "jambalaya_circle",
        squareThumbnail: "jambalaya_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[3].id,
        name: "Barbecue Chicken Jollof Rice",
        durationCooking: 60,
        evaluate: 4.5,
        country: "Greece",
        circleThumbnail: "jollof_circle",
        squareThumbnail: "jollof_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[4].id,
        name: "Portuguese Piri Piri Chicken",
        durationCooking: 45,
        evaluate: 4.5,
        country: "Portugal",
        circleThumbnail: "piri_circle",
        squareThumbnail: "piri_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[0].id,
        name: "Steak with tomato sauce and bulgur rice",
        durationCooking: 35,
        evaluate: 5,
        country: "Portugal",
        circleThumbnail: "steak_circle",
        squareThumbnail: "steak_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[1].id,
        name: "Pilaf sweet with lamb-and-raisins",
        durationCooking: 70,
        evaluate: 4.5,
        country: "Middle East",
        circleThumbnail: "pilaf_circle",
        squareThumbnail: "pilaf_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[2].id,
        name: "Rice Pilaf",
        durationCooking: 30,
        evaluate: 4.0,
        country: "Middle East",
        circleThumbnail: "ricepilaf_circle",
        squareThumbnail: "ricepilaf_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[3].id,
        name: "Chicken meal with sauce",
        durationCooking: 30,
        evaluate: 4.0,
        country: "Middle East",
        circleThumbnail: "chicken_sauce_circle",
        squareThumbnail: "chicken_sauce_square",
        createdAt: Date()
    ),
    Recipe(
        id_user: mockUsers[4].id,
        name: "Stir-fry chicken with broccoli in sweet and sour sauce and rice",
        durationCooking: 35,
        evaluate: 5,
        country: "Middle East",
        circleThumbnail: "stirfry_circle",
        squareThumbnail: "stirfry_square",
        createdAt: Date()
    )
]
