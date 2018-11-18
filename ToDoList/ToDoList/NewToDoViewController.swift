//
//  NewToDoViewController.swift
//  ToDoList
//
//  Created by Németh Bendegúz on 2018. 11. 18..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class NewToDoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var priorityPickerView: UIPickerView!
    
    var selectedPriority: Priority = .normal
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        priorityPickerView.delegate = self
        
        priorityPickerView.selectRow(1, inComponent: 0, animated: true)
        
        let borderGray = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        descriptionTextView.layer.borderColor = borderGray.cgColor
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.cornerRadius = 5
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewToDoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Priority.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Priority.allValues[row].rawValue.capitalized
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPriority = Priority.allValues[row]
    }
    
}

extension NewToDoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
}
