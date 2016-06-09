//
//  UserController.swift
//  SurveyAPI
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class UserController {
    
    static let baseUrl = NSURL(string: "https://surveyapi.firebaseio.com/api")
    
    static func putUserDataToNetwork(name: String, champsResponse: String, mvpResponse: String) {
        let user = User(name: name, champsResponse: champsResponse, mvpResponse: mvpResponse)
        
        guard let url = user.endpoint else {return}
        
        NetworkController.performRequestForURL(url, httpMethod: .Put, body: user.jsonData) { (data, error) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            } else {
                print("Succesfully posted")
            }
        }
    }
    
}