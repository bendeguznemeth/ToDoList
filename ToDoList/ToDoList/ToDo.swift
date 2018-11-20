//
//  ToDo.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 13..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import Foundation

struct ToDo: Codable {

    let name: String
    let description: String
    let date: Date
    let priority: Priority
    
}

enum Priority: String, Codable {
    case low
    case normal
    case high
    
    static let allValues = [high, normal, low]
    
    func value() -> Int {
        switch self {
        case .high:
            return 0
        case .normal:
            return 1
        case .low:
            return 2
        }
    }
}
