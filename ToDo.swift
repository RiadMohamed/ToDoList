//
//  ToDo.swift
//  ToDoList
//
//  Created by Riad Mohamed on 6/9/19.
//  Copyright © 2019 RiadMohamed. All rights reserved.
//

import UIKit

struct ToDo {
	var title: String?
	var isComplete: Bool
	var dueDate: Date
	var notes: String?
	
	static func loadToDos() -> [ToDo]? {
		return nil
	}
	
	static func loadSampleToDos() -> [ToDo] {
		return [ToDo(title: "T1", isComplete: false, dueDate: Date(), notes: "N1"),
				ToDo(title: "T2", isComplete: false, dueDate: Date(), notes: "N2"),
				ToDo(title: "T3", isComplete: true, dueDate: Date(), notes: "N3")]
	}
	
	static let dueDateFormatter : DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		formatter.timeStyle = .short
		return formatter
	}()
}
