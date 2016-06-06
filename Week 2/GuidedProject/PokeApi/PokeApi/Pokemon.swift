//
//  Pokemon.swift
//  PokeApi
//
//  Created by Emily Mearns on 6/6/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Pokemon {
    
    let name: String
    let id: Int
    var abilities: [String] = []
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String, id = dictionary["id"] as? Int, abilitiesArray = dictionary["abilities"] as? [[String: AnyObject]] else {return nil}
        
        self.name = name
        self.id = id
        
        for abilityDictionary in abilitiesArray {
            let ability = abilityDictionary["ability"] as? [String: AnyObject]
            let name = ability?["name"] as? String
            if let name = name {
                abilities.append(name)
            }
        }
    }
    
}