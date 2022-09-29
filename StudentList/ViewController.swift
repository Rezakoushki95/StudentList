//
//  ViewController.swift
//  StudentList
//
//  Created by Reza Koushki on 21/09/2022.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var studentNames = [
		"Michael",
		"Christopher",
		"Jessica",
		"Matthew",
		"Ashley",
		"Jennifer",
		"Joshua",
		"Amanda",
		"Daniel",
		"David",
		"James",
		"Robert",
		"John",
		"Joseph",
		"Andrew",
		"Ryan",
		"Brandon",
		"Jason",
		"Justin"
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowStudentDetail" {
			let destination = segue.destination as! StudentDetailViewController
			let selectedIndexPath = tableView.indexPathForSelectedRow!
			destination.studentName = studentNames[selectedIndexPath.row]
		} else {
			if let selectedIndexPath = tableView.indexPathForSelectedRow {
				tableView.deselectRow(at: selectedIndexPath, animated: false)
			}
		}
	}
	
	@IBAction func unwindFromStudentDetail(segue: UIStoryboardSegue) {
		let source = segue.source as! StudentDetailViewController
		if let selectedIndexPath = tableView.indexPathForSelectedRow {
			studentNames[selectedIndexPath.row] = source.studentName
			tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
		} else {
			let newIndexPath = IndexPath(row: studentNames.count, section: 0)
			studentNames.append(source.studentName)
			tableView.insertRows(at: [newIndexPath], with: .bottom)
			tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
			
		}
	}

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return studentNames.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = studentNames[indexPath.row]
		return cell
	}
}

