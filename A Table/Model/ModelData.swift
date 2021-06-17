//
//  ModelData.swift
//  A Table
//
//  Created by Vladimir Weinstein on 6/7/21.
//

import Foundation
import Combine

class ModelData: ObservableObject {
    
    @Published var recipes: [Recipe] = load("recipeData.json")
    
    func toggleFavorite(recipe: Recipe){
        if let index = recipes.firstIndex(where: { $0.id == recipe.id}) {
            recipes[index].isFavorite.toggle()
        }
    }

    
    var features: [Recipe] {
        recipes.filter { $0.isFeatured }
    }
    
    var categories: [String: [Recipe]] {
        Dictionary(
            grouping: recipes,
            by: { $0.category.rawValue }
        )
    }
}




func load<T: Decodable>(_ filename: String) -> T {
    var data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
