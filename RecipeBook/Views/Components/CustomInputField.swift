//
//  CustomInputField.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

struct CustomInputField: View {
    
    var label: String
    var placeholder: String
    var isDisabled: Bool = false
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .textStyle(.smallRegular)
                .foregroundStyle(Asset.black.swiftUIColor)
            
            TextField(placeholder, text: $text)
                .disabled(isDisabled)
                .padding(.horizontal, 20)
                .frame(height: 55)
                .foregroundColor(textColor)
                .font(.custom(FontFamily.Poppins.regular.name, size: 11))
                .lineSpacing(6)
                .focused($isFocused)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderColor, lineWidth: 1.5)
                )
        }
    }
    
    private var borderColor: Color {
        if isFocused {
            return .primary80
        } else {
            return .gray4
        }
    }
    
    private var placeholderColor: Color {
        if isDisabled {
            return .gray2
        } else {
            return .gray4
        }
    }
    
    private var textColor: Color {
        if isDisabled {
            return .gray2
        } else {
            return .black
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow { placeholder().padding(.horizontal, 12) }
            self
        }
    }
}

#Preview {
    CustomInputFieldPreview()
}

struct CustomInputFieldPreview: View {
    @State private var text: String = ""

    var body: some View {
        CustomInputField(label: "Email", placeholder: "Enter Email", text: $text)
            .padding()
    }
}

