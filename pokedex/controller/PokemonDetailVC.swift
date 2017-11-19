//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Łukasz Pusz on 19.11.2017.
//  Copyright © 2017 Łukasz Pusz. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
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
}
