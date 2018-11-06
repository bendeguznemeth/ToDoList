//
//  ViewController.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 06..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            return cell
        } else {
            return UITableViewCell.init()
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        titleLabel.text = "Napi teendők, Napi teendők, Napi teendők, Napi teendők, Napi teendők, Napi teendők"
        
    }


}

