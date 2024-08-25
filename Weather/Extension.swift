//
//  Extension.swift
//  Weather
//
//  Created by Гидаят Джанаева on 25.08.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
