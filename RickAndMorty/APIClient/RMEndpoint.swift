//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 15.08.2024.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String {
    /// An endpoint to get characters info
    case character
    /// An endpoint to get locations info
    case location
    /// An endpoint to get episodes info
    case episode
}
