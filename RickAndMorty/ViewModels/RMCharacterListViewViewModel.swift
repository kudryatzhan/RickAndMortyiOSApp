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
                print("Total count: \(response.info.count)")
                print("Page result count: \(response.results.count)")
                
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
                                                      for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.window!.screen.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
