//
//  PokeCell.swift
//  pokedex
//
//  Created by Łukasz Pusz on 16.11.2017.
//  Copyright © 2017 Łukasz Pusz. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalized
        pokemonImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
