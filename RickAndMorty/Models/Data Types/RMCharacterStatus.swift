//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 09.02.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    // 'Alive', 'Dead' or 'unknown'
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
