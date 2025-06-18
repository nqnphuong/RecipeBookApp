//
//  SplashScreen.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

struct SplashScreen: View {
    var onFinish: () -> Void
    
    var body: some View {
        ZStack {
            
            // MARK: - Background Layer
            ZStack {
                Image("bg-start")
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(
                    colors: [
                        .black.opacity(0.4),
                        .black.opacity(1.0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
            .ignoresSafeArea()
            
            // MARK: - Content Layer
            VStack {
                VStack(spacing: 14) {
                    Image("app-icon")
                        .resizable()
                        .frame(width: 79, height: 79)
                    
                    Text("100K+ Premium Recipe")
                        .foregroundStyle(.gray5)
                        .textStyle(.mediumBold)
                }
                .padding(.top, 60)
                
                Spacer()
                
                VStack(spacing: 64) {
                    VStack(spacing: 20) {
                        Text("Get Cooking")
                            .foregroundStyle(Asset.gray5.swiftUIColor)
                            .lineSpacing(0) // This place needs to be temporarily reviewed. I don't understand why it's the correct lineHeight.
                            .textStyle(.titleBold)
                        
                        Text("Simple way to find Tasty Recipe")
                            .foregroundStyle(Asset.gray5.swiftUIColor)
                            .textStyle(.normalRegular)
                    }
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 50)
                    
                    CustomButton(
                        title: "Start Cooking",
                        iconName: "arrow.right",
                        action: onFinish,
                        size: .medium
                    )
                }
                .padding(.bottom, 50)
            }
            .safeAreaPadding([.top, .bottom])
        }
    }
}

#Preview {
    SplashScreen {
        print("Splash Finished – chuyển sang SignIn")
    }
}

