//
//  StarshipViewController.swift
//  StarWarsAPI
//
//  Created by Emily Mearns on 6/8/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class StarshipViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }

    func searchBarSearchButton(sender: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        StarshipController.getStarship(searchTerm) { (starship) in
            self.nameLabel.text = starship?.name
            self.modelLabel.text = starship?.model
            self.ratingLabel.text = starship?.hyperdriveRating
        }
    }
    
    


}
