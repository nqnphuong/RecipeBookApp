//
//  NavigationApp.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

struct NavigationApp: View {
    
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        ZStack {
            switch coordinator.flow {
            case .splash:
                SplashScreen {
                    coordinator.goToSignIn()
                }
                
            case .signIn:
                SignInScreen(
                    goToSignUp: { coordinator.goToSignUp() },
                    goToHome: { coordinator.goToHome() }
                )
                
            case .signUp:
                SignUpScreen {
                    coordinator.goToSignIn()
                }
                
            case .home:
                TabNavigation()
            }
        }
        .animation(.easeInOut, value: coordinator.flow)
        .transition(.opacity)
    }
}
