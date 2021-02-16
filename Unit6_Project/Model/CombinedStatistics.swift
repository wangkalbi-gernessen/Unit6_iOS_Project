//
//  CombinedStatistics.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-15.
//

import Foundation

struct CombinedStatistics {
    let userStatistics: [UserStatistics]
    let habitStatistics: [HabitStatistics]
}

extension CombinedStatistics: Codable { }
