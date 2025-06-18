//
//  CustomSearchBar.swift
//  RecipeBook
//
//  Created by Mac on 18/6/25.
//

import SwiftUI

struct CustomSearchBar: View {
    
    var placeholder: String
    var isDisabled: Bool
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack() {
            Image("search-normal")
                .resizable()
                .frame(width: 18, height: 18)
                .padding(.all, 10)
            TextField(placeholder, text: $text)
                .disabled(isDisabled)
                .frame(height: 40)
                .foregroundColor(textColor)
                .font(.custom(FontFamily.Poppins.regular.name, size: 11))
                .lineSpacing(6)
                .focused($isFocused)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 1.5)
        )
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

#Preview {
    CustomSearchBarPreview()
}

struct CustomSearchBarPreview: View {
    @State private var text: String = ""
    var body: some View {
        CustomSearchBar(placeholder: "Placeholder", isDisabled: false, text: $text)
    }
}
