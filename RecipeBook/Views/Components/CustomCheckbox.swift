//
//  CustomCheckbox.swift
//  RecipeBook
//
//  Created by Mac on 17/6/25.
//

import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    var label: String

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 10) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary100, lineWidth: 1.5)
                        .background(
                            isChecked ? .secondary100 : .clear
                        )
                        .frame(width: 17, height: 17)

                    if isChecked {
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                    }
                }

                Text(label)
                    .textStyle(.smallerRegular)
                    .foregroundStyle(.secondary100)

                Spacer()
            }
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    StatefulPreviewWrapper(false) { binding in
        CustomCheckbox(isChecked: binding, label: "Accept terms & Condition")
            .padding()
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> Content

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
