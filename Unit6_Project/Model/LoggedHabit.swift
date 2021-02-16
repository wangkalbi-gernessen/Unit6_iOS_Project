//
//  LoggedHabit.swift
//  Unit6_Project
//
//  Created by Kazunobu Someya on 2021-02-14.
//

import Foundation

struct LoggedHabit {
    let userID: String
    let habitName: String
    let timeStamp: Date
}

extension LoggedHabit: Codable {}
