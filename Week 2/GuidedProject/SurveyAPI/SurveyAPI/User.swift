//
//  User.swift
//  SurveyAPI
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class User {
    
    private let keyName = "name"
    private let keyChamps = "champsResponse"
    private let keyMvp = "mvpResponse"
    
    let name: String
    let champsResponse: String
    let mvpResponse: String
    let identifier: NSUUID
    
    var jsonValue: [String: AnyObject] {
        return [keyName:name, keyChamps:champsResponse, keyMvp:mvpResponse]
    }
    
    var jsonData: NSData? {
        return try? NSJSONSerialization.dataWithJSONObject(jsonValue, options: .PrettyPrinted)
    }
    
    var endpoint: NSURL? {
        return UserController.baseUrl?.URLByAppendingPathComponent(identifier.UUIDString).URLByAppendingPathExtension("json")
    }
    
    init(name: String, champsResponse: String, mvpResponse: String) {
        self.name = name
        self.champsResponse = champsResponse
        self.mvpResponse = mvpResponse
        self.identifier = NSUUID()
    }
    
    
    
}