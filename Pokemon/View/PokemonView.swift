//
//  PokemonView.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import SwiftUI

struct PokemonView: View {
    @StateObject var pokemonVm: PokemonViewModel
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(pokemonVm.pokemonArray){ pokemon in
                        NavigationLink{
                            DetailsView(detailVM: DetailViewModel(repository: DetailRepositoryImplementation(networkManager: NetworkManager())), apiCall: pokemon.url)
                        } label: {
                            Text(pokemon.name)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .task{
                await pokemonVm.getPokemonList(urlString: APIEndPoint.pokemonAPIEndPoint)
        }
        }
    }
}

#Preview {
    PokemonView(pokemonVm: PokemonViewModel(repository: PokemonRepositoryImplementation(networkManager: NetworkManager())))
}
