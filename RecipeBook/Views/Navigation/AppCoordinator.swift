//
//  AppCoordinator.swift
//  RecipeBook
//
//  Created by Mac on 18/6/25.
//

import Foundation

enum AppFlow {
    case splash
    case signIn
    case signUp
    case home
}

class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow = .splash
    
    func goToSignIn() {
        flow = .signIn
    }
    
    func goToSignUp() {
        flow = .signUp
    }
    
    func goToHome() {
        flow = .home
    }
}
