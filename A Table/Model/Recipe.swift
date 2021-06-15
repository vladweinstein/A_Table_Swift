//
//  Recipe.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/7/21.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var meat: String
    var cookTime: String
    var description: String
    var ingredients: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
        enum Category: String, CaseIterable, Codable {
            case appetizer = "Appetizers"
            case maincourse = "Main Course"
            case dessert = "Sweets & Desserts"
        }
    
    private var imageName: String
       var image: Image {
           Image(imageName)
       }
    
    var featureImage: Image? {
           isFeatured ? Image(imageName + "_feature") : nil
       }
   }

