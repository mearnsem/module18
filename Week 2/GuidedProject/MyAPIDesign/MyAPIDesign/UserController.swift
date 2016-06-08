//
//  UserController.swift
//  MyAPIDesign
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class UserController {
    
    static let baseUrl = NSURL(string: "https://emilyapidesign.firebaseio.com/api")
    static let getterEndpoint = baseUrl?.URLByAppendingPathExtension("json")
    
    static func putUserInfoToNetwork(name: String, response: String) {
        let user = User(name: name, response: response)
        
        guard let url = user.endpoint else {return}
        
        NetworkController.performRequestForURL(url, httpMethod: .Put, body: user.jsonData) { (data, error) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            } else {
                print("Succesfully uploaded")
            }
        }
    }
    
    static func getUserInfo(completion: (user: [User]) -> Void) {
        
        
        guard let url = getterEndpoint else {return}
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data, jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                completion(user: [])
                return
            }
            dispatch_async(dispatch_get_main_queue(), { 
                let users = jsonDictionary.flatMap({User(dictionary: $0.1, identifier: $0.0)})
                print(users)
                completion(user: users)
            })
            
            
            
        }
    }
    
}