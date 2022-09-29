//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Reza Koushki on 21/09/2022.
//

import UIKit

class StudentDetailViewController: UIViewController {
	
	@IBOutlet weak var studentNameField: UITextField!
	
	var studentName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
		if studentName == nil {
			studentName = ""
		}
		studentNameField.text = studentName
		
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		studentName = studentNameField.text
	}
	
	
	@IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
		let isPresentingInAddMode = presentingViewController is UINavigationController
		if isPresentingInAddMode {
			dismiss(animated: true, completion: nil)
		} else {
			navigationController?.popViewController(animated: true)
		}
		
	}
}
