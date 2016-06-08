//
//  User.swift
//  MyAPIDesign
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class User {
    
    private let keyName = "nombre"
    private let keyResponse = "respuesta"
    
    let name: String
    let response: String
    let identifier: NSUUID
    
    var jsonValue: [String: AnyObject] {
        return [keyName:name, keyResponse:response]
    }
    
    var jsonData: NSData? {
        return try? NSJSONSerialization.dataWithJSONObject(jsonValue, options: .PrettyPrinted)
    }
    
    var endpoint: NSURL? {
        return UserController.baseUrl?.URLByAppendingPathComponent(identifier.UUIDString).URLByAppendingPathExtension("json")
    }
    
    init(name: String, response: String) {
        self.name = name
        self.response = response
        self.identifier = NSUUID()
    }
    
    init?(dictionary: [String: AnyObject], identifier: String) {
        guard let name = dictionary[keyName] as? String, response = dictionary[keyResponse] as? String, identifier = NSUUID(UUIDString: identifier) else {return nil}
        self.name = name
        self.response = response
        self.identifier = identifier
    }
    
}