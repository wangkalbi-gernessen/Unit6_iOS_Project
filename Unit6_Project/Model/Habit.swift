//
//  Habit.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-13.
//

import Foundation

struct Habit: Codable{
    let name: String
    let category: Category
    let info: String
}

extension Habit: Hashable {
    static func == (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension Habit: Comparable {
    
    static func < (lhs: Habit, rhs: Habit) -> Bool {
            return lhs.name < rhs.name
        }
}
