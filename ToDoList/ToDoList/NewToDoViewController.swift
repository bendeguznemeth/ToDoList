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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
        priorityPickerView.delegate = self
        
        priorityPickerView.selectRow(1, inComponent: 0, animated: true)
        
        let borderGray = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        descriptionTextView.layer.borderColor = borderGray.cgColor
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.cornerRadius = 5
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        descriptionTextView.resignFirstResponder()
    }
    
    @IBAction func onSaveClick(_ sender: UIBarButtonItem) {
        save()
        close()
    }
    
    private func makeToDo() -> ToDo {
        let name = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        let date = datePicker.date
        let priority = Priority.allValues[priorityPickerView.selectedRow(inComponent: 0)]
        
        return ToDo.init(name: name, description: description, date: date, priority: priority)
    }
    
    private func save() {
        let toDo = makeToDo()
        ToDoManager.sharedInstance.addToDo(toDo)
    }
    
    private func close() {
        self.navigationController?.popViewController(animated: true)
    }
    
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
    
}

extension NewToDoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
}
