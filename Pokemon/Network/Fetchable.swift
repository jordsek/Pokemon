//
//  Fetchable.swift
//  Pokemon
//
//  Created by Jor . on 08/04/2024.
//

import Foundation

protocol Fetchable {
    func getDataFromAPI(url: URL) async throws -> Data
}
