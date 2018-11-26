//
//  ToDoManager.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 20..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import Foundation

class ToDoManager: NSObject {
    
    var dataSource: [ToDo] = []
    
    static let sharedInstance = ToDoManager.init()
    
    static let userDefKey = "userDefKey"
    
    private override init() {
        super.init()
        loadToDos()
    }
    
    func addToDo(_ todo: ToDo) {
        dataSource.append(todo)
        sortByPriority()
        saveToDos()
    }
    
    func removeToDo(at indexPath: Int) {
        dataSource.remove(at: indexPath)
        saveToDos()
    }
    
    private func sortByPriority() {
        dataSource.sort { (toDo1, toDo2) -> Bool in
            return toDo1.priority.value() < toDo2.priority.value()
        }
    }
    
    private func saveToDos() {
        if let encoded = try? JSONEncoder().encode(dataSource) {
            UserDefaults.standard.set(encoded, forKey: ToDoManager.userDefKey)
        }
    }
    
    func loadToDos() {
        guard let data = UserDefaults.standard.data(forKey: ToDoManager.userDefKey) else {
            return
        }
        
        guard let todos = try? JSONDecoder().decode([ToDo].self, from: data) else {
            return
        }
        
        dataSource = todos
    }
}
