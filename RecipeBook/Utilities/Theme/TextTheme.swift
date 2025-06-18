//
//  TextTheme.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import Foundation
import SwiftUI

enum TextStyle: String, CaseIterable {
    case titleBold, headerBold, largeBold, mediumBold, normalBold, smallBold, smallerBold
    case titleRegular, headerRegular, largeRegular, mediumRegular, normalRegular, smallRegular, smallerRegular
}

struct FontModifier: ViewModifier {
    var size: CGFloat
    var weight: SwiftUI.Font.Weight
    var lineHeight: CGFloat
    var fontName: String? = nil

    func body(content: Content) -> some View {
        content
            .font(fontName != nil ? SwiftUI.Font.custom(fontName!, size: size) : .system(size: size, weight: weight))
            .lineSpacing(lineHeight - size)
    }
}

struct TextTheme {
    func modifier(for style: TextStyle) -> some ViewModifier {
        switch style {
        case .titleBold:
            return FontModifier(size: 50, weight: .semibold, lineHeight: 75, fontName: FontFamily.Poppins.bold.name)
        case .headerBold:
            return FontModifier(size: 30, weight: .semibold, lineHeight: 45, fontName: FontFamily.Poppins.bold.name)
        case .largeBold:
            return FontModifier(size: 20, weight: .semibold, lineHeight: 30, fontName: FontFamily.Poppins.bold.name)
        case .mediumBold:
            return FontModifier(size: 18, weight: .semibold, lineHeight: 27, fontName: FontFamily.Poppins.bold.name)
        case .normalBold:
            return FontModifier(size: 16, weight: .semibold, lineHeight: 24, fontName: FontFamily.Poppins.bold.name)
        case .smallBold:
            return FontModifier(size: 14, weight: .semibold, lineHeight: 21, fontName: FontFamily.Poppins.bold.name)
        case .smallerBold:
            return FontModifier(size: 11, weight: .semibold, lineHeight: 17, fontName: FontFamily.Poppins.bold.name)
            
        case .titleRegular:
            return FontModifier(size: 50, weight: .regular, lineHeight: 75, fontName: FontFamily.Poppins.regular.name)
        case .headerRegular:
            return FontModifier(size: 30, weight: .regular, lineHeight: 45, fontName: FontFamily.Poppins.regular.name)
        case .largeRegular:
            return FontModifier(size: 20, weight: .regular, lineHeight: 30, fontName: FontFamily.Poppins.regular.name)
        case .mediumRegular:
            return FontModifier(size: 18, weight: .regular, lineHeight: 27, fontName: FontFamily.Poppins.regular.name)
        case .normalRegular:
            return FontModifier(size: 16, weight: .regular, lineHeight: 24, fontName: FontFamily.Poppins.regular.name)
        case .smallRegular:
            return FontModifier(size: 14, weight: .regular, lineHeight: 21, fontName: FontFamily.Poppins.regular.name)
        case .smallerRegular:
            return FontModifier(size: 11, weight: .regular, lineHeight: 17, fontName: FontFamily.Poppins.regular.name)
        }
    }
}

extension View {
    func textStyle(_ style: TextStyle) -> some View {
        let theme = TextTheme()
        return self.modifier(theme.modifier(for: style))
    }
}
