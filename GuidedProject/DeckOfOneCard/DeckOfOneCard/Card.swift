//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Emily Mearns on 6/1/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Card {
    
    private let keySuit = "suit"
    private let keyValue = "value"
    private let keyImageString = "image"
    
    let suit: String
    let value: String
    let imageString: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let suit = dictionary[keySuit] as? String, value = dictionary[keyValue] as? String, imageString = dictionary[keyImageString] as? String else {
            return nil
        }
        self.suit = suit
        self.value = value
        self.imageString = imageString
    }
    
}