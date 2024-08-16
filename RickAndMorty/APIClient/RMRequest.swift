//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 15.08.2024.
//

import Foundation

/// An object that represents a single API call
final class RMRequest {
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in string format
    private var urlString: String {
        var string = Constants.baseUrl + "/" + endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach { string += "/\($0)" }            
        }
        
        if !queryParameters.isEmpty {
            string += "/?"
            let argumentString = queryParameters.compactMap { queryItem -> String? in
                guard let value = queryItem.value else { return nil }
                return "\(queryItem.name)=\(value)"
            }.joined(separator: "&")
            
            string += argumentString
        }
        return string
    }
    
    // MARK: - Public
    
    public var url: URL? {
        URL(string: urlString)
    }
    
    public init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}
 
extension RMRequest {
    static let allCharactersRequest = RMRequest(endpoint: .character)
}
