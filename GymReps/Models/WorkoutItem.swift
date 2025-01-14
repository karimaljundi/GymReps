//
//  WorkoutItem.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import Foundation

struct WorkoutItem: Codable, Identifiable{
    let id: String
    let title: String
    let startDate: TimeInterval
    let endDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
