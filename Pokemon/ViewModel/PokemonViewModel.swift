//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    
    @Published var customError: NetworkError?
    @Published var pokemonArray: [PokemonEntity] = []
    
    let repository: PokemonRepository
    init( repository: PokemonRepository) {
        self.repository = repository
        
    }
    
    
    func getPokemonList(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let results = try await repository.getPokemons(url: url)
           // DispatchQueue.main.async { [self] in
            self.pokemonArray = results.results.map{
                PokemonEntity(name: $0.name , url:  $0.url)
            }
               print(pokemonArray)
            //}
        } catch {
            print(error)
        }
    }
}
