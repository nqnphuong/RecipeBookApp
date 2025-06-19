//
//  HomeScreen.swift
//  RecipeBook
//
//  Created by Mac on 18/6/25.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedCountry: Int = 0

    var body: some View {
        VStack(spacing: 15) {
            HeaderView()
                .padding(.horizontal, 30)

            CustomTabs(
                data: ["All", "Indian", "Italian", "Asian", "Chinese"],
                isScrollable: true,
                paddingEnd: 30,
                selectedIndex: $selectedCountry
            )
            .padding(.vertical, 10)
            .padding(.leading, 30)

            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 20) {
                    RecipesByCountry(recipesData: mockRecipes, paddingEnd: 30)
                    
                    Text("New Recipes")
                        .foregroundColor(.black)
                        .textStyle(.normalBold)
                }.padding(.leading, 30)
                
                NewRecipes(recipesData: mockRecipes, paddingEnd: 30)
            }
            Spacer()
        }
        .padding(.top, 20)
    }
}

// MARK: - Header View
private struct HeaderView: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hello Jega")
                        .foregroundStyle(.black)
                        .textStyle(.largeBold)

                    Text("What are you cooking today?")
                        .foregroundStyle(.gray3)
                }

                Spacer()

                Image("avatar")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.secondary40)
                            .frame(width: 40, height: 40)
                    )
            }

            SearchBar()
        }
    }
}

// MARK: - Search Bar
private struct SearchBar: View {
    @State private var text: String = ""

    var body: some View {
        HStack(spacing: 20) {
            CustomSearchBar(
                placeholder: "Search recipe",
                isDisabled: false,
                text: $text
            )

            Image("setting-4")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.primary100)
                        .frame(width: 40, height: 40)
                )
        }
    }
}

#Preview {
    HomeScreen()
}
