//
//  User.swift
//  RecipeBook
//
//  Created by Mac on 19/6/25.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var email: String
    var name: String
    var password: String
    
    var avatar: String
    var followers: Int
    var following: Int
    var descriptions: String
}
