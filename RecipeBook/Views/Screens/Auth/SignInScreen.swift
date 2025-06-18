//
//  SignInScreen.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

struct SignInScreen: View {
    var goToSignUp: () -> Void
    var goToHome: () -> Void
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderSection()
            
            VStack(spacing: 20) {
                InputSection(email: $email, password: $password)
                ForgotPasswordText()
                SignInButton(action: { /* logic */ }).padding(.top, 5)
                SocialLoginDivider()
                SocialLoginButtons()
                SignUpLink()
            }
            .padding(.top, 57)
        }
        .padding(.horizontal, 30)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        Spacer()
    }
}

// MARK: - Subviews

private struct HeaderSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Hello,")
                .foregroundStyle(Asset.black.swiftUIColor)
                .textStyle(.headerBold)
            
            Text("Welcome Back!")
                .foregroundStyle(Asset.black.swiftUIColor)
                .textStyle(.largeRegular)
        }
        .padding(.top, 50)
    }
}

private struct InputSection: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 30) {
            CustomInputField(label: "Email", placeholder: "Enter Email", text: $email)
            CustomInputField(label: "Password", placeholder: "Enter Password", text: $password)
        }
    }
}

private struct ForgotPasswordText: View {
    var body: some View {
        Text("Forgot Password?")
            .foregroundStyle(.secondary100)
            .textStyle(.smallerRegular)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
    }
}

private struct SignInButton: View {
    let action: () -> Void
    
    var body: some View {
        CustomButton(
            title: "Sign In",
            iconName: "arrow.right",
            action: action,
            size: .big
        )
    }
}

private struct SocialLoginDivider: View {
    var body: some View {
        HStack(spacing: 7) {
            Rectangle().fill(.gray4).frame(width: 50, height: 1)
            Text("Or Sign in With")
                .foregroundStyle(.gray4)
                .textStyle(.smallerRegular)
            Rectangle().fill(.gray4).frame(width: 50, height: 1)
        }
    }
}

private struct SocialLoginButtons: View {
    var body: some View {
        HStack(spacing: 25) {
            ForEach(["google", "facebook"], id: \.self) { icon in
                Button {
                    // Social login action
                } label: {
                    Image(icon)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray5)
                        )
                }
                .shadow(color: Color.black.opacity(0.1), radius: 5)
            }
        }
    }
}

private struct SignUpLink: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("Don’t have an account?")
                .foregroundStyle(.black)
                .textStyle(.smallerRegular)
            
            Button {
                // Navigate to SignUp
            } label: {
                Text("Sign up")
                    .foregroundStyle(.secondary100)
                    .textStyle(.smallerRegular)
            }
        }
        .padding(.top, 35)
    }
}

#Preview {
    NavigationStack {
        SignInScreen(
            goToSignUp: {
                print("Đi tới SignUp (preview)")
            },
            goToHome: {
                print("Đi tới Home (preview)")
            }
        )
    }
}

