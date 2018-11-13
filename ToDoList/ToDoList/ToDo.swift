//
//  ToDo.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 13..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

struct ToDo {

    let name: String
    
    enum Priority: String {
        case low
        case normal
        case high
    }
    
    let priority: Priority
    
}
