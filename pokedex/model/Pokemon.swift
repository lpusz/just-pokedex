//
//  Pokemon.swift
//  pokedex
//
//  Created by Łukasz Pusz on 15.11.2017.
//  Copyright © 2017 Łukasz Pusz. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!

    var description: String {
        if _description == nil {
            _description = "-"
        }
        
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = "-"
        }
        
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = "-"
        }
        
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = "-"
        }
        
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = "-"
        }
        
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = "-"
        }
        
        return _attack
    }
    
    var nextEvolutionText: String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = "-"
        }
        
        return _nextEvolutionText
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId!)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        self._type = nil
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let stat = stats[4]["stat"] as? Dictionary<String, AnyObject> {
                        if let name = stat["name"] as? String {
                            if name == "attack" {
                                if let attack = stats[4]["base_stat"] as? Int {
                                    self._attack = "\(attack)"
                                }
                            }
                        }
                    }
                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>] {
                    if let stat = stats[3]["stat"] as? Dictionary<String, AnyObject> {
                        if let name = stat["name"] as? String {
                            if name == "defense" {
                                if let defense = stats[3]["base_stat"] as? Int {
                                    self._defense = "\(defense)"
                                }
                            }
                        }
                    }
                }
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>], types.count > 0 {
                    for index in 0..<types.count {
                        if let type = types[index]["type"] as? Dictionary<String, AnyObject> {
                            if let name = type["name"] as? String {
                                var separator = ""
                                if self._type == nil {
                                    self._type = ""
                                } else {
                                    separator = "/"
                                }
                                
                                self._type = "\(self._type!)\(separator)\(name.capitalized)"
                            }
                        }
                    }
                }
                
                if let species = dict["species"] as? Dictionary<String, AnyObject> {
                    if let uri = species["url"] as? String {
                        Alamofire.request(uri).responseJSON(completionHandler: { (response) in
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                if let textEntries = descDict["flavor_text_entries"] as? [Dictionary<String, AnyObject>] {
                                    if let desc = textEntries[1]["flavor_text"] as? String {
                                        self._description = desc
                                        print(self._description)
                                    }
                                }
                                
                                completed()
                            } 
                        })
                    }
                }
                
                print(self._weight)
                print(self._height)
                print(self._name)
                print(self._attack)
                print(self._defense)
                print(self._type)
            }
            
            completed()
        }
    }

}
