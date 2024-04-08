//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

protocol PokemonRepository {
    func getPokemons(url: URL) async throws -> PokemonData
}

final class PokemonRepositoryImplementation: PokemonRepository {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getPokemons(url: URL) async throws -> PokemonData {
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode(PokemonData.self, from: data)
            return result
        }catch {
            throw error
            
        }
    }
    
    
}
