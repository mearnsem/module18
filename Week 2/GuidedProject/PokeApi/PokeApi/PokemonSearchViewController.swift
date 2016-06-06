//
//  PokemonSearchViewController.swift
//  PokeApi
//
//  Created by Emily Mearns on 6/6/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        PokemonController.getPokemon(searchTerm) { (pokemon) in
            self.nameLabel.text = pokemon?.name
            self.idLabel.text = "\(pokemon?.id ?? 0)"
            self.abilitiesLabel.text = "Abilities: \(pokemon?.abilities.joinWithSeparator(", ") ?? "")"
        }
    }

}
