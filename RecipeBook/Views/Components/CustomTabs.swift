//
//  CustomTabs.swift
//  RecipeBook
//
//  Created by Mac on 18/6/25.
//

import SwiftUI

struct CustomTabs: View {
    
    var data: [String]
    var isScrollable: Bool
    var paddingEnd: CGFloat
    @Binding var selectedIndex: Int
    @Namespace private var animationNamespace
    
    var body: some View {
        Group {
            if isScrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        tabItems
                    }
                }
                .frame(height: 35) // chỗ này bị thừa, mà chưa tìm được cách khác để giới hạn chiều cao của scrollview
            } else {
                HStack(spacing: tabSpacing) {
                    tabItems
                }
            }
        }
    }
    
    private var tabItems: some View {
        ForEach(0..<data.count, id: \.self) { index in
            Button(action: {
                withAnimation(.easeInOut) {
                    selectedIndex = index
                }
            }) {
                Text(data[index])
                    .font(.caption)
                    .foregroundColor(selectedIndex == index ? .white : .primary100)
                    .frame(maxWidth: isScrollable ? nil : .infinity)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(
                        ZStack {
                            if selectedIndex == index {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.primary100)
                                    .matchedGeometryEffect(id: "tabBackground", in: animationNamespace)
                            }
                        }
                    )
            }
            .padding(.trailing, isScrollable && index == data.count - 1 ? paddingEnd : 0)
            .buttonStyle(.plain)
        }
    }
    
    private var tabSpacing: CGFloat {
        switch data.count {
        case 2: return 7
        case 3: return 15
        default: return 10
        }
    }
}

#Preview {
    CustomTabsPreview()
}

struct CustomTabsPreview: View {
    @State private var selectedIndex1: Int = 0
    @State private var selectedIndex2: Int = 0
    @State private var selectedIndex3: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            CustomTabs(
                data: ["All", "Indian", "Italian", "Asian", "Chinese"],
                isScrollable: true,
                paddingEnd: 30,
                selectedIndex: $selectedIndex1
            )
            
            CustomTabs(
                data: ["Ingredient", "Procedure"],
                isScrollable: false,
                paddingEnd: 30,
                selectedIndex: $selectedIndex2
            )
            
            CustomTabs(
                data: ["Overview", "Steps", "Review"],
                isScrollable: false,
                paddingEnd: 30,
                selectedIndex: $selectedIndex3
            )
        }
    }
}
