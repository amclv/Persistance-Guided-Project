//
//  StarController.swift
//  Stars
//
//  Created by Aaron Cleveland on 12/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// Model Controller - The object that controls the app's interactions with the model object. Model Controllers are ~always classes

class StarControllers {
    
    var stars: [Star] = []
    
    // Read
        // Any time the app wants to access it's stars, they'll live in the StarController
    
    // Create
        // since we have the create method, we no longer are going to init a star outside of the model controller. for example, no
    
    @discardableResult func createStar(with name: String, distance: Double) -> Star {
        // at the least, init a star and return it.
        let star = Star(name: name, distance: distance)
        stars.append(star)
        return star
    }
    
    // MARK: - Persistence
    
    // where is this going to be saved to?
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    }
    
    // saving function
    
    // loading function
    
}
