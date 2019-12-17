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
    
    // this is the starcontrollers init. we dont need to pass in anything but we can use it more as a viewdidload for the starcontroller
    init() {
        loadFromPersistentStore()
    }
    
    // Read
        // Any time the app wants to access it's stars, they'll live in the StarController
    
    // Create
        // since we have the create method, we no longer are going to init a star outside of the model controller. for example, no
    
    @discardableResult func createStar(with name: String, distance: Double) -> Star {
        // at the least, init a star and return it.
        let star = Star(name: name, distance: distance)
        
        stars.append(star)
        saveToPersistentStore()
        
        return star
    }
    
    // MARK: - Persistence
    
    // where is this going to be saved to?
    
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let starsURL = documentsDir.appendingPathComponent("stars.plist")
        return starsURL
    }
    
    // saving function
    
    func saveToPersistentStore() {
            
        // make sure the fileURL exists, otherwise we cant save the stars there.
        guard let fileURL = persistentFileURL else { return }
        
        do {
            
            let encoder = PropertyListEncoder()
            
            let starsData = try encoder.encode(stars)
            
            try starsData.write(to: fileURL)
        } catch {
            print("Error Saving stars: \(error)")
        }
    }
    
    // loading function
    
    func loadFromPersistentStore() {
        
        guard let fileURL = persistentFileURL else { return }
        
        do {
            let starsData = try Data(contentsOf: fileURL)
            
            let decoder = PropertyListDecoder()
            
            let starsArray = try decoder.decode([Star].self, from: starsData)
            
            self.stars = starsArray
            
        } catch {
            
            print("Error loading stars from plist: \(error)")
            
        }
        
        
    }
}
