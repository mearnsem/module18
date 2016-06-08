//
//  Starship.swift
//  StarWarsAPI
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Starship {
    
    let name: String
    let model: String
    let hyperdriveRating: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String, model = dictionary["model"] as? String, hyperdriveRating = dictionary["hyperdrive_rating"] as? String else {return nil}
        self.name = name
        self.model = model
        self.hyperdriveRating = hyperdriveRating
    }
    
}