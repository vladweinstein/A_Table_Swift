//
//  RecipeDetail.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/8/21.
//

import SwiftUI
import MessageUI


struct RecipeDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMailView = false
    
    var recipe: Recipe
    
    var recipeIndex: Int {
        modelData.recipes.firstIndex(where: { $0.id == recipe.id })!
    }
    
    
    var body: some View {
        ScrollView {
            RectangleImage(image: recipe.image)
                .scaledToFill()
                .clipped()
                .frame(height: 280)
                .padding(.bottom, -80)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(recipe.name)
                        .bold()
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding([.top, .leading], 20.0)
                    FavoriteButton(isSet: $modelData.recipes[recipeIndex].isFavorite)
                        .padding(.top, 20.0)
                }
                
                HStack {
                    Text(recipe.meat)
                    Spacer()
                    Text(recipe.cookTime)
                    
                }
                .font(.title3)
                .foregroundColor(.secondary)
                .padding(.horizontal, 20)
                
                
                List {
                    Text("Ingredients (scroll to view all)")
                        .font(.subheadline)
                    Text(recipe.ingredients)
                    
                }
                
                .frame(height: 160)
                
                
                VStack {
                    Text("Directions")
                        .font(.subheadline)
                        .padding(.bottom, 5)
                        .padding(.top, 10)
                    Text(recipe.description)
                }
                
                .padding(.horizontal, 30)
                
                Group {
                    
                    HStack {
                        let buttonHeight: CGFloat = 45

                        Spacer().frame(width: 20)
                        
                        FavoriteButton(isSet: $modelData.recipes[recipeIndex].isFavorite)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                        
                        Spacer()
                        
                        Button(action: {
                            if MFMailComposeViewController.canSendMail() {
                                self.isShowingMailView.toggle()
                            } else {
                                print("Can't send emails from this device")
                            }
                            if result != nil {
                                print("Result: \(String(describing: result))")
                            }
                        }) {
                            Text("Share Feedback")
                                .bold()
                                .foregroundColor(.white)
                                .frame(height: buttonHeight)
                                .padding(.horizontal, 22)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 55)
                    
                    Spacer().frame(height: 10)
                }
                
                    }
            
            
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: $result) { composer in
                    composer.setSubject("Recipe Suggestion")
                    composer.setToRecipients(["vlad@vladw.com"])
                }
            }
            .background(Color.white)
            .cornerRadius(25)
            .padding()
            .navigationTitle(recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RecipeDetail(recipe: modelData.recipes[0])
            .environmentObject(modelData)
    }
}
