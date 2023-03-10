//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 09.02.2023.
//

import Foundation

enum RMCharacterGender: String, Codable {
    // 'Female', 'Male', 'Genderless' or 'unknown'
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}
