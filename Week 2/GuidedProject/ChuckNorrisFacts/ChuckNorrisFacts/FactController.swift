//
//  FactController.swift
//  ChuckNorrisFacts
//
//  Created by Emily Mearns on 6/6/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class FactController {
    
    static let baseUrl = NSURL(string: "https://api.chucknorris.io/jokes/random")
    
    static func getFact(completion: (fact: Fact?) -> Void) {
        guard let url = baseUrl else {return}
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data, jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                completion(fact: nil)
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let fact = Fact(dictionary: jsonDictionary)
                completion(fact: fact)
            })
            
        }
    }
}