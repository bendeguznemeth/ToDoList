//
//  ToDo.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 13..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

struct ToDo {

    let name: String
    
    let priority: Priority
    
}

enum Priority: String {
    case low
    case normal
    case high
    
    static let allValues = [high, normal, low]
}
