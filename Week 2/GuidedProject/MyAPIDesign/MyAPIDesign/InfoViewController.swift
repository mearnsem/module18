//
//  InfoViewController.swift
//  MyAPIDesign
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var responseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserController.getUserInfo { (user) in
            
        }
    }
    
    // MARK: - Action Buttons
    
    @IBAction func submitButtnTapped(sender: AnyObject) {
        guard let name = nameTextField.text, response = responseTextField.text where name.characters.count > 0 && response.characters.count > 0 else {return}
        UserController.putUserInfoToNetwork(name, response: response)
        nameTextField.text = ""
        responseTextField.text = ""
    }
    
}
