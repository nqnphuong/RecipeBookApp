//
//  NewRecipes.swift
//  RecipeBook
//
//  Created by Mac on 19/6/25.
//

import SwiftUI

struct NewRecipes: View {
    var recipesData: [Recipe]
    var usersData = mockUsers
    var paddingEnd: CGFloat
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .bottom, spacing: 15) {
                ForEach(recipesData.indices, id: \.self) { index in
                    var author: User? {
                        usersData.first(where: { $0.id == recipesData[index].id_user })
                    }
                    RecipeCard(
                        recipe: recipesData[index],
                        author: author!,
                        isLast: index == recipesData.count - 1,
                        isFirst: index == 0,
                        paddingEnd: 30
                    )
                }
            }
        }
        .frame(height: 150)
    }
}

private struct RecipeCard: View {
    let recipe: Recipe
    let author: User
    let isLast: Bool
    let isFirst: Bool
    var paddingEnd: CGFloat
    
    var body: some View {
        Button(action: {
            print(recipe.name)
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .frame(width: 251, height: 95)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                
                recipeImage.offset(x: 10, y: -40)
                
                VStack(alignment: .leading) {
                    titleView
                    evaluateView
                    
                    Spacer()
                    
                    HStack {
                        authorView
                        Spacer()
                        durationCookingView
                    }
                }
                .padding(.horizontal, 9.3)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(width: 251, height: 95)
            }
            
        }
        .padding(.trailing, isLast ? paddingEnd : 0)
        .padding(.leading, isFirst ? paddingEnd : 0)
        .buttonStyle(.plain)
    }
    
    private var recipeImage: some View {
        HStack {
            Spacer()
            Image(recipe.circleThumbnail)
                .resizable()
                .frame(width: 120, height: 120)
        }
    }
    
    private var titleView: some View {
        GeometryReader { geometry in
            Text(recipe.name)
                .foregroundColor(.gray1)
                .textStyle(.smallBold)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: geometry.size.width * 0.6, alignment: .leading)
        }
        .frame(height: 20)
    }
    
    
    private var evaluateView: some View {
        let fullStarts = Int(recipe.evaluate)
        let hasHalfStar = (Double(recipe.evaluate) - Double(fullStarts)) >= 0.5
        
        return HStack(spacing: 2) {
            ForEach(0..<fullStarts, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(.rating)
                    .frame(width: 12, height: 12)
            }
            
            if hasHalfStar {
                Image(systemName: "star.leadinghalf.filled")
                    .resizable()
                    .foregroundColor(.rating)
                    .frame(width: 12, height: 12)
            }
        }
    }
    
    private var authorView: some View {
        HStack(spacing: 8) {
            Image(author.avatar)
                .resizable()
                .frame(width: 25, height: 25)
            
            Text(author.name)
                .foregroundColor(.gray3)
                .textStyle(.smallerRegular)
        }
    }
    
    private var durationCookingView: some View {
        HStack(spacing: 5) {
            Image("timer")
                .resizable()
                .frame(width: 17, height: 17)
            
            Text("\(Int(recipe.durationCooking)) mins")
                .foregroundColor(.gray3)
                .textStyle(.smallerRegular)
        }
    }
}


#Preview {
    NewRecipes(recipesData: mockRecipes, paddingEnd: 30)
}
