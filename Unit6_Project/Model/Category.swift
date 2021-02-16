//
//  Category.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-13.
//

import Foundation

struct Category: Codable {
    let name: String
    let color: Color
}

extension Category: Hashable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
