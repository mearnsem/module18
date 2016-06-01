//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by Emily Mearns on 6/1/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawCard(sender: AnyObject) {
        CardController.drawCards(1) { (cards) in
            guard let card = cards.first else {
                return
            }
            ImageController.imageForUrl(card.imageString, completion: { (image) in
                self.cardImageView.image = image
            })
        }
    }

}

