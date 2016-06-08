//
//  StarshipController.swift
//  StarWarsAPI
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class StarshipController {
    
    static let baseUrl = "https://swapi.co/api/starships/"
    
    static func getStarship(searchTerm: String, completion: (starship: Starship?) -> Void) {
        let searchURL = baseUrl + searchTerm.lowercaseString
        let url = NSURL(string: searchURL)
        
        guard let unwrappedUrl = url else { return }
        
        NetworkController.performRequestForURL(unwrappedUrl, httpMethod: .Get) { (data, error) in
            guard let data = data, starshipDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                completion(starship: nil)
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let starship = Starship(dictionary: starshipDictionary)
                completion(starship: starship)
            })
        }
    }
    
}