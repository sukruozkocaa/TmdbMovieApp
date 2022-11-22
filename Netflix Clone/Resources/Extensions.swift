//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Şükrü Özkoca on 1.11.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
