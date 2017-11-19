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
    @IBOutlet weak var defenceLabel: UILabel!
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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
