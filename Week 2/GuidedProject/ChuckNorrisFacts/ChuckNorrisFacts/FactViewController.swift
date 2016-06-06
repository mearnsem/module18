//
//  FactViewController.swift
//  ChuckNorrisFacts
//
//  Created by Emily Mearns on 6/6/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class FactViewController: UIViewController {

    @IBOutlet weak var factLabel: UILabel!

    @IBAction func factButtonTapped(sender: AnyObject) {
        FactController.getFact { (fact) in
            self.factLabel.text = fact?.text
        }
    }
}
