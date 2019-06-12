//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Riad Mohamed on 6/12/19.
//  Copyright © 2019 RiadMohamed. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var isCompleteButton: UIButton!
	@IBOutlet weak var dueDateLabel: UILabel!
	@IBOutlet weak var dueDatePicker: UIDatePicker!
	@IBOutlet weak var notesTextView: UITextView!
	@IBOutlet weak var saveButton: UIBarButtonItem!
	@IBAction func textEditingChanged(_ sender: UITextField) {
		updateSaveButtonState()
	}
	@IBAction func returnPressed(_ sender: UITextField) {
		titleTextField.resignFirstResponder()
	}
	@IBAction func isCompleteButtonTapped(_ sender: UIButton) {
		isCompleteButton.isSelected.toggle()
	}
	
	@IBAction func datePickerChanged(_ sender: UIDatePicker) {
		updateDueDateLabel(date: dueDatePicker.date)
	}
	
	func updateSaveButtonState() {
		let text = titleTextField.text ?? ""
		saveButton.isEnabled = !text.isEmpty
	}
	
	func updateDueDateLabel(date: Date){
		dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateDueDateLabel(date: dueDatePicker.date)
		updateSaveButtonState()
	}
}
