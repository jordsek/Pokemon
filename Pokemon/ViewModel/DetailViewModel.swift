//
//  DetailViewModel.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    
    @Published var pokemonSprites: Sprites?
    @Published var customError: NetworkError?
    
    
    let repository: DetailRepository
    init( repository: DetailRepository) {
        self.repository = repository
        
    }
    
    
    func getDetailList(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let results = try await repository.getDetails(url: url)
           // DispatchQueue.main.async { [self] in
            self.pokemonSprites = results.sprites
            print(pokemonSprites!)
            //}
        } catch {
            print(error)
        }
    }
}
