//
//  FeatureCard.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI


struct FeatureCard: View {
    var recipe: Recipe
    
    // Building function to rotate through breakfast/lunch/dinner recipes showcased in FeatureCard in CategoryHome based on calendar hour.
    // Function not currently in use.
    
    // Must update features.map in CategoryHome line 35
    // Must build new breakfast/lunch/dinner specific image var in 'Recipe' file

    private func showMealType() -> Bool {
         let hour = Calendar.current.component(.hour, from: Date())
         let breakfast = recipe.isBreakfast
         let lunch = recipe.isLunch
         let dinner = recipe.isDinner
         
         switch hour {
         case 4..<12:
             return breakfast
         case 12..<17:
             return lunch
         case 17..<4:
             return dinner
         default:
             break
         }
         return true
     }
    
    // fun above not currently in use.
    
    var body: some View {
        
        NavigationLink(destination: RecipeDetail(recipe: recipe)) {
            recipe.featureImage?
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
                .overlay(TextOverlay(recipe: recipe))
                .cornerRadius(5)
                .padding(.horizontal)
        }
    }
}

struct TextOverlay: View {
    var recipe: Recipe
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title)
                    .bold()
                Text(recipe.cookTime)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(recipe: ModelData().features[0])
    }
}
