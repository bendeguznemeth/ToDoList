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
    
    private var dataSource: [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        makeData()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ToDoTableViewCell {
            let todo = dataSource[indexPath.row]
            cell.showCellData(todo: todo)
            return cell
        } else {
            return UITableViewCell.init()
        }
    }
    
    private func makeData() {
        let firstData = ToDo.init(name: "Grocery", priority: .normal)
        let secondData = ToDo.init(name: "Szemesz", priority: .low)
        let thirdData = ToDo.init(name: "Egyetem", priority: .high)
        
        dataSource = [firstData, secondData, thirdData]
    }
    
    @IBAction func addToDo(_ sender: UIBarButtonItem) {
        let staticToDo = ToDo.init(name: "attrecto", priority: .high)
        dataSource.append(staticToDo)
        tableView.reloadData()
    }
    
}
