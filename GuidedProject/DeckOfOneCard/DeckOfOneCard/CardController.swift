//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Emily Mearns on 6/1/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void) {
        guard let url = self.baseURL else { fatalError("URL optional is nil") }
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        //pass url to networkcontroller.performrequest to fetch data at url
        NetworkController.performRequestWithUrl(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            //performrequest will complete/return with data at that url
            guard let data = data, jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments), jsonDictionary = jsonAnyObject as? [String: AnyObject], cardDictionaries = jsonDictionary["cards"] as? [[String: AnyObject]] else {
                completion(cards: [])
                return
            }
            let cards = cardDictionaries.flatMap { Card(dictionary: $0) }
            completion(cards: cards)
        }
        
    }
}