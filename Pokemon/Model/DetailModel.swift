//
//  DetailModel.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

struct DetailModel: Codable{
    let sprites: Sprites
    
}

struct Sprites: Codable{
    var frontShiny = "front_shiny"
    let other: Other
    //let frontDefault = "front_default"
    
    
    enum CoddingKeys: String, CodingKey{
        case frontShiny = "front_shiny"
        case other
        
    }
}
struct Other: Codable{
    let home: Home
}

struct Home: Codable {
    let frontDefault: String
    let frontShiny: String
    
    enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
