//
//  ViewController.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 06..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createDatasource(from: ToDoManager.sharedInstance.dataSource)
        tableView.reloadData()
    }
    
    // MARK: - TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSource[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ToDoTableViewCell {
            let todo = self.dataSource[indexPath.section].rows[indexPath.row]
            cell.showCellData(todo: todo)
            return cell
        } else {
            return UITableViewCell.init()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.dataSource[section].priority.rawValue.capitalized
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let name = dataSource[indexPath.section].rows[indexPath.row].name
            ToDoManager.sharedInstance.removeToDo(with: name)
            
            dataSource[indexPath.section].rows.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    private func createDatasource(from todos: [ToDo]) {
        
        dataSource = []
        
        let highTodos = todos.filter { (todo) -> Bool in
            return todo.priority == .high
        }
        let normalTodos = todos.filter { (todo) -> Bool in
            return todo.priority == .normal
        }
        let lowTodos = todos.filter { (todo) -> Bool in
            return todo.priority == .low
        }
        
        if !highTodos.isEmpty {
            let highSection = Section.init(priority: .high, rows: highTodos)
            dataSource.append(highSection)
        }
        if !normalTodos.isEmpty {
            let normalSection = Section.init(priority: .normal, rows: normalTodos)
            dataSource.append(normalSection)
        }
        if !lowTodos.isEmpty {
            let lowSection = Section.init(priority: .low, rows: lowTodos)
            dataSource.append(lowSection)
        }
        
    }
    
}

struct Section {
    let priority: Priority
    var rows: [ToDo]
}
