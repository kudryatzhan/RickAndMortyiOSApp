//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 18.08.2024.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
    
    public let characterName: String
    private let characterStatus: RMCharacter.Status
    private let characterImageURL: URL?

    public var characterStatusText: String {
        characterStatus.rawValue
    }
    
    // MARK: - Init
    
    init(characterName: String, characterStatus: RMCharacter.Status, characterImageURL: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageURL = characterImageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = characterImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
    
}
