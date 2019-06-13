//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Riad Mohamed on 6/9/19.
//  Copyright © 2019 RiadMohamed. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
	var todos = [ToDo]()
	@IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
		guard segue.identifier == "saveSegue" else { return }
		let sourceVC = segue.source as! ToDoViewController
		if let todo = sourceVC.todo {
			if let selectedIndexPath = tableView.indexPathForSelectedRow {
				todos[selectedIndexPath.row] = todo
				tableView.reloadRows(at: [selectedIndexPath], with: .none)
			} else {
				let newIndexPath = IndexPath(row: todos.count, section: 0)
				todos.append(todo)
				tableView.insertRows(at: [newIndexPath], with: .automatic)
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return todos.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") else {
			fatalError("Could Not Deque Cell")
		}
		let todo = todos[indexPath.row]
		cell.textLabel?.text = todo.title
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			todos.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetails" {
			let todoVC = segue.destination as! ToDoViewController
			let indexPath = tableView.indexPathForSelectedRow!
			todoVC.todo = todos[indexPath.row]
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let savedToDos = ToDo.loadToDos() {
			todos = savedToDos
		} else {
			todos = ToDo.loadSampleToDos()
		}
		navigationItem.leftBarButtonItem = editButtonItem
	}
}
