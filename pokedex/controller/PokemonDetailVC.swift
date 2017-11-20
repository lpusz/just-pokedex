//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Łukasz Pusz on 19.11.2017.
//  Copyright © 2017 Łukasz Pusz. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvolutionImage: UIImageView!
    @IBOutlet weak var nextEvolutionImage: UIImageView!
    @IBOutlet weak var evolutionLabel: UILabel!
    
    private var _pokemon: Pokemon!
    
    var pokemon: Pokemon {
        get {
            return _pokemon
        } set {
            _pokemon = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        mainImage.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvolutionImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokedexLabel.text = "\(pokemon.pokedexId)"
        nextEvolutionImage.isHidden = true
        
        pokemon.downloadPokemonDetails(completed: {
            // Whatever we write here will only be called after the network call is complete
            self.updateUI()
        })
    }
    
    func updateUI () {
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
    
        if pokemon.nextEvolutionName != "" {
            evolutionLabel.text = "Next evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
        } else {
            evolutionLabel.text = "Next evolution: -"
        }
        
        if pokemon.nextEvolutionId != -1 {
            nextEvolutionImage.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            nextEvolutionImage.isHidden = false
        }
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
