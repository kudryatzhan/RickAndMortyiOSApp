//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 16.08.2024.
//

import UIKit

class RMCharacterListViewViewModel: NSObject {
    
    func fetchCharacters() {
        RMService.shared.execute(.allCharactersRequest , expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case let .success(response):
                print("Example image URL: \(response.results.first?.image ?? "No image URL")")
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! RMCharacterCollectionViewCell
        
        let viewModel = RMCharacterCollectionViewCellViewModel(
            characterName: "John Smith",
            characterStatus: .alive,
            characterImageURL: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.window!.screen.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
