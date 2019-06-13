//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Riad Mohamed on 6/13/19.
//  Copyright © 2019 RiadMohamed. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate : class {
	func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
	var delegate : ToDoCellDelegate?
	
	@IBOutlet weak var isCompleteButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!
	
	@IBAction func isCompleteButtonTapped(_ sender: UIButton) {
		delegate?.checkmarkTapped(sender: self)
	}
	

}
