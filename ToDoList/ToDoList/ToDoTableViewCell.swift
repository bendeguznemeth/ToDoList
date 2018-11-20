//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 13..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoImageView: UIImageView!
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showCellData(todo: ToDo) {
        todoLabel.text = todo.name
        todoImageView.image = UIImage.init(named: todo.priority.rawValue)
        dateLabel.text = stringFromDate(todo.date)
        descriptionLabel.text = todo.description
    }
    
    private func stringFromDate(_ date: Date) -> String {
        let formatter = DateFormatter.init()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

}
