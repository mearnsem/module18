//
//  PokemonController.swift
//  PokeApi
//
//  Created by Emily Mearns on 6/6/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let baseUrl = "http://pokeapi.co/api/v2/pokemon/"
    
    static func getPokemon(searchTerm: String, completion: (pokemon: Pokemon?) -> Void) {
        let searchUrl = baseUrl + searchTerm.lowercaseString
        let url = NSURL(string: searchUrl)
        
        guard let unwrappedUrl = url else {return}
        
        NetworkController.performRequestForURL(unwrappedUrl, httpMethod: .Get) { (data, error) in
            guard let data = data, jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                completion(pokemon: nil)
                return
            }
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                let pokemon = Pokemon(dictionary: jsonDictionary)
                completion(pokemon: pokemon)
            }
        }
        
    }
    
}