//
//  Fact.swift
//  ChuckNorrisFacts
//
//  Created by Emily Mearns on 6/6/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Fact {
    
    let text: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let text = dictionary["value"] as? String else {return nil}
        self.text = text
    }
    
}