//
//  CustomButton.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

enum CustomButtonSize {
    case big, medium, small, custom
}

struct CustomButton: View {
    let title: String
    var iconName: String? = nil
    var action: () -> Void
    var size: CustomButtonSize = .big

    var backgroundColor: Color = .primary100
    var foregroundColor: Color = .gray5
    var cornerRadius: CGFloat = 10
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    var spacing: CGFloat? = nil
    var fontStyle: TextStyle? = nil
    var isDisabled: Bool = false

    @State private var isPressed: Bool = false

    var body: some View {
        Button(action: action) {
            HStack(spacing: spacingFor(size)) {
                Text(title)
                    .textStyle(fontStyleFor(size))
                if let icon = iconName {
                    Image(systemName: icon)
                }
            }
            .foregroundColor(foregroundColor)
            .frame(
                maxWidth: widthFor(size),
                minHeight: heightFor(size),
                maxHeight: heightFor(size)
            )
            .background(currentBackgroundColor())
            .cornerRadius(cornerRadius)
        }
        .disabled(isDisabled)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }

    private func currentBackgroundColor() -> Color {
        return isDisabled ? .gray4 : backgroundColor
    }

    private func heightFor(_ size: CustomButtonSize) -> CGFloat {
        switch size {
        case .big: return 60
        case .medium: return 54
        case .small: return 37
        case .custom: return height ?? 50
        }
    }

    private func widthFor(_ size: CustomButtonSize) -> CGFloat? {
        switch size {
        case .big: return .infinity
        case .medium: return 243
        case .small: return 174
        case .custom: return width
        }
    }

    private func spacingFor(_ size: CustomButtonSize) -> CGFloat {
        switch size {
        case .big: return 11
        case .medium: return 9
        default: return 0
        }
    }

    private func fontStyleFor(_ size: CustomButtonSize) -> TextStyle {
        switch size {
        case .big, .medium: return .normalBold
        case .small: return .smallerBold
        case .custom: return fontStyle ?? .normalBold
        }
    }
}

#Preview {
    CustomButton(title: "Start Cooking",
                 iconName: "arrow.right",
                 action: {},
                 size: .medium)
    
    CustomButton(
        title: "Submit",
        iconName: "arrow.right",
        action: { print("Submit") },
        size: .medium,
        isDisabled: true,
    )
}
