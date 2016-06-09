//
//  SurveyViewController.swift
//  SurveyAPI
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var championLabel: UITextField!
    @IBOutlet weak var mvpLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnPressed(sender: AnyObject) {
        guard let name = nameLabel.text, champsResponse = championLabel.text, mvpResponse = mvpLabel.text where name.characters.count > 0 && champsResponse.characters.count > 0 && mvpResponse.characters.count > 0 else {return}
        UserController.putUserDataToNetwork(name, champsResponse: champsResponse, mvpResponse: mvpResponse)
        nameLabel.text = ""
        championLabel.text = ""
        mvpLabel.text = ""
    }
    

}
