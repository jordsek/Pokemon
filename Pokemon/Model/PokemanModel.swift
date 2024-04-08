//
//  PokemanModel.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

struct PokemonData: Codable {
    let count: Int
    let next, previous: String
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonEntity: Codable, Identifiable, Hashable {
    let name: String
    let url: String
    var id = UUID()
}

