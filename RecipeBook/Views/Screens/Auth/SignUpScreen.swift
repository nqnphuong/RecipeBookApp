//
//  SignUp.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

struct SignUpScreen: View {
    var goToSignIn: () -> Void
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State var isChecked = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeaderSection()
                
                VStack(spacing: 20) {
                    InputSection(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword)
                    CustomCheckbox(isChecked: $isChecked, label: "Accept terms & Condition").padding(.leading, 10)
                    SignUpButton(action: goToSignIn).padding(.top, 5)
                    SocialLoginDivider()
                    SocialLoginButtons()
                    SignUpLink(action: goToSignIn)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

// MARK: - Subviews

private struct HeaderSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Create an account")
                .foregroundStyle(.black)
                .textStyle(.largeBold)
            
            Text("Let’s help you set up your account,\nit won’t take long.")
                .foregroundStyle(.black)
                .textStyle(.smallerRegular)
        }
        .padding(.top, 10)
    }
}

private struct InputSection: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    
    var body: some View {
        VStack(spacing: 30) {
            CustomInputField(label: "Name", placeholder: "Enter Name", text: $name)
            CustomInputField(label: "Email", placeholder: "Enter Email", text: $email)
            CustomInputField(label: "Password", placeholder: "Enter Password", text: $password)
            CustomInputField(label: "Confirm Password", placeholder: "Retype Password", text: $confirmPassword)
        }
    }
}

private struct SignUpButton: View {
    let action: () -> Void
    
    var body: some View {
        CustomButton(
            title: "Sign Up",
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
            Text("Or Sign up With")
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
    let action : () -> Void
    
    var body: some View {
        HStack(spacing: 4) {
            Text("Already a member?")
                .foregroundStyle(.black)
                .textStyle(.smallerRegular)
            
            Button {
                action()
            } label: {
                Text("Sign in")
                    .foregroundStyle(.secondary100)
                    .textStyle(.smallerRegular)
            }
        }
        .padding(.top, 10)
    }
}

#Preview {
    SignUpScreen(goToSignIn: {
        print("Xin chao")
    })
}
