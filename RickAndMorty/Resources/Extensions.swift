//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 16.08.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
