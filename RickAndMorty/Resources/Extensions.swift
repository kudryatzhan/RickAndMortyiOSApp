//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Kudryatzhan Arziyev on 11.02.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
