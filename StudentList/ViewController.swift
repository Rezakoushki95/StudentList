//
//  ViewController.swift
//  StudentList
//
//  Created by Reza Koushki on 21/09/2022.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	let studentNames = [
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

