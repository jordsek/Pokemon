//
//  DetailRepository.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

protocol DetailRepository {
    func getDetails(url: URL) async throws -> DetailModel
}

final class DetailRepositoryImplementation: DetailRepository {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getDetails(url: URL) async throws -> DetailModel{
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode(DetailModel.self, from: data)
            return result
        }catch {
            throw error
            
        }
    }
    
    
}
