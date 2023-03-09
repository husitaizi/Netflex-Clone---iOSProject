//
//  Extensions.swift
//  Netflex Clone
//
//  Created by ChuantaiHu on 2023-03-03.
//

import Foundation

extension String{
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
