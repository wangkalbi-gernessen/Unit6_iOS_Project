//
//  HabitCount.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-15.
//

import Foundation

struct HabitCount {
    let habit: Habit
    let count: Int
}

extension HabitCount: Codable {}
extension HabitCount: Hashable {}

extension HabitCount: Comparable {
    static func < (lhs: HabitCount, rhs: HabitCount) -> Bool {
        return lhs.habit < rhs.habit
    }
}
