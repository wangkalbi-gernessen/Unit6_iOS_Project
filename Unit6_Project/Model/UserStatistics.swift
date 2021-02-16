//
//  UserStatistics.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-15.
//

import Foundation

struct UserStatistics {
    let user: User
    let habitCounts: [HabitCount]
}

extension UserStatistics: Codable {}

