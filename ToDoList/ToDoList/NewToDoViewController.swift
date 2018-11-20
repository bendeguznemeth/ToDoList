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
    
//    var selectedPriority: Priority = .normal
    
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
        ToDoManager.sharedInstance.addToDo(todo: toDo)
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
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedPriority = Priority.allValues[row]
//    }
    
}

extension NewToDoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
}
