//
//  TabNavigation.swift
//  RecipeBook
//
//  Created by Mac on 18/6/25.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable {
    case home = 0
    case save
    case newRecipe
    case notification
    case profile
    
    var iconName: String {
        switch self {
        case .home:
            return "home"
        case .save:
            return "Inactive"
        case .newRecipe:
            return "plus"
        case .notification:
            return "notification-bing"
        case .profile:
            return "profile"
        }
    }
}

struct TabNavigation: View {
    
    @State private var selectedTab: TabbedItems = .home
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home: HomeScreen()
            case .save: SavedScreen()
            case .newRecipe: NewRecipeScreen()
            case .notification: NotificationScreen()
            case .profile: ProfileScreen()
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabbedItems
    var height: CGFloat = 0
    
    var body: some View {
        ZStack {
            CustomTabBarShape(
                gutter: 50 * 1.4,
                valley: 50 * 0.8,
                position: height
            )
            .fill(Color.white)
            .shadow(color: Color(hex: "#6C6C6C").opacity(0.08), radius: 8)
            .frame(height: 72)
            
            HStack {
                ForEach(TabbedItems.allCases, id: \.self) { tab in
                    if tab == .newRecipe {
                        Spacer()
                            .frame(width: 80)
                    } else {
                        tabButton(tab)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal, 30)
            
            Button(action: {
                selectedTab = .newRecipe
            }) {
                Image(systemName: TabbedItems.newRecipe.iconName)
                    .foregroundColor(.white)
                    .frame(width: 48, height: 48)
                    .background(.primary100)
                    .clipShape(Circle())
            }
            .offset(y: -30)
            
        }
    }
    
    func tabButton(_ tab: TabbedItems) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(tab.iconName)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .foregroundColor(selectedTab == tab ? .green : .gray)
        }
    }
}

// https://github.com/sweetclimusic/TabBarAnimation
struct CustomTabBarShape: Shape {
    var gutter: CGFloat
    var valley: CGFloat
    var position: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let curveStartX = CGPoint(x: (rect.midX - gutter), y: 0)
        let dipEnd = CGPoint(x: rect.midX + gutter, y: 0)
        let radius = (gutter * 0.5)
        let startX = rect.midX - radius
        let endX = rect.midX + radius
        let dipStart = CGPoint(x: rect.midX, y: valley + position)
        
        //create a dip with a movable apex
        var path = Path()
        // draw a basic rect the size of the frame
        path.addRect(rect)
        // move to center of rect and form a dip by settign the control in the +Y axis, We will animate this apex for the slingshot withAnimatable and using a spring curve.
        path.move(to: curveStartX )
        //add two bezierPath
        
        path.addCurve(to: dipStart,
                      control1: CGPoint(x: startX, y: 0),
                      control2: CGPoint(x: startX, y: valley + position))
        path.addCurve(to: dipEnd,
                      control1: CGPoint(x: endX, y: valley + position),
                      control2: CGPoint(x: endX, y: 0))
        return path
    }
}

#Preview {
    TabNavigation()
}
