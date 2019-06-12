//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Riad Mohamed on 6/12/19.
//  Copyright © 2019 RiadMohamed. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
	var isDatePickerHidden = true
	var todo: ToDo?

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
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let normalHeight = CGFloat(44)
		let extendedHeight = CGFloat(200)
		switch indexPath {
		case [1,0]:
			return isDatePickerHidden ? normalHeight : extendedHeight
		case [2, 0]:
			return extendedHeight
		default:
			return normalHeight
		}
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch indexPath {
		case [1,0]:
			isDatePickerHidden.toggle()
			dueDateLabel.textColor = isDatePickerHidden ? .black : tableView.tintColor
			tableView.beginUpdates()
			tableView.endUpdates()
		default:
			break
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		dueDatePicker.date = Date().addingTimeInterval(60*60*24)
		updateDueDateLabel(date: dueDatePicker.date)
		updateSaveButtonState()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		guard segue.identifier == "saveSegue" else {
			return
		}
		let title = titleTextField.text!
		let isComplete = isCompleteButton.isSelected
		let dueDate = dueDatePicker.date
		let notes = notesTextView.text
		todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
		
	}
}
