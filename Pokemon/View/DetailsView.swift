//
//  DetailsView.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import SwiftUI

struct DetailsView: View {
    var detailVM : DetailViewModel?
    var apiCall: String
    var body: some View {
        VStack {
            Text("Head")
        }
        .task {
            await detailVM?.getDetailList(urlString: "https://pokeapi.co/api/v2/pokemon/21/")
        }
    }
}

#Preview {
    DetailsView(apiCall: "https://pokeapi.co/api/v2/pokemon/21/")
}
