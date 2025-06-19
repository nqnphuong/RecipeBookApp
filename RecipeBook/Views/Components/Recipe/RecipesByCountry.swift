//
//  RecipesByCountry.swift
//  RecipeBook
//
//  Created by Mac on 19/6/25.
//

import SwiftUI

struct RecipesByCountry: View {
    
    var recipesData: [Recipe]
    var paddingEnd: CGFloat
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .bottom , spacing: 15) {
                ForEach(recipesData.indices, id: \.self) { index in
                    RecipeCard(
                        recipe: recipesData[index],
                        isLast: index == recipesData.count - 1,
                        paddingEnd: 30
                    )
                }
            }
        }
        .frame(height: 231)
    }
}

private struct RecipeCard: View {
    let recipe: Recipe
    let isLast: Bool
    var paddingEnd: CGFloat
    
    var body: some View {
        Button(action: {
            print(recipe.name)
        }) {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray4)
                    .frame(width: 150, height: 176)
                
                ZStack() {
                    recipeImage
                        .offset(y: -80)
                    
                    ratingView
                        .offset(y: -25)
                    
                    VStack() {
                        titleView
                        Spacer()
                        bottomInfo
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 66)
                    .padding(.bottom, 10)
                }
            }
            .frame(width: 150, height: 176)
        }
        .padding(.trailing, isLast ? paddingEnd : 0)
        .buttonStyle(.plain)
    }
    
    private var recipeImage: some View {
        Image(recipe.circleThumbnail)
            .resizable()
            .frame(width: 150, height: 150)
    }
    
    private var ratingView: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.rating)
            
            Text(String(format: "%.1f", recipe.evaluate))
                .foregroundColor(.black)
                .textStyle(.smallerRegular)
        }
        .padding(.horizontal, 7)
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.secondary20)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
    
    private var titleView: some View {
        Text(recipe.name)
            .foregroundColor(.gray1)
            .textStyle(.smallBold)
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
    
    private var bottomInfo: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Time")
                    .foregroundColor(.gray3)
                    .textStyle(.smallerRegular)
                
                Text("\(Int(recipe.durationCooking)) Mins")
                    .foregroundColor(.gray1)
                    .textStyle(.smallerBold)
            }
            
            Spacer()
            
            ZStack{
                Circle()
                    .fill(Color.white)
                    .frame(width: 24, height: 24)
                
                Image("Inactive")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.primary80)
                    .frame(width: 16, height: 16)
            }
        }
    }
}


#Preview {
    RecipesByCountry(recipesData: mockRecipes, paddingEnd: 30)
}
