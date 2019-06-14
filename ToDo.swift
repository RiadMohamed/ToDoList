//
//  ToDo.swift
//  ToDoList
//
//  Created by Riad Mohamed on 6/9/19.
//  Copyright © 2019 RiadMohamed. All rights reserved.
//

import UIKit

struct ToDo : Codable {
	var title: String?
	var isComplete: Bool
	var dueDate: Date
	var notes: String?
	
	static func loadToDos() -> [ToDo]? {
		guard let codedToDos = try? Data(contentsOf: ArchiveURL) else { return nil }
		let plistDecoder = PropertyListDecoder()
		return try? plistDecoder.decode(Array<ToDo>.self, from: codedToDos)
	}
	
	static func saveToDos(todos: [ToDo]) {
		let plistEncoder = PropertyListEncoder()
		let codedToDos = try? plistEncoder.encode(todos)
		try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
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
	
	static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
}
