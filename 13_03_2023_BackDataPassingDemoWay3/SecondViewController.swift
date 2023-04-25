//
//  SecondViewController.swift
//  13_03_2023_BackDataPassingDemoWay3
//
//  Created by Vishal Jagtap on 24/04/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var rollNumberTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
  
    var delegate : BackDataPassing?     //backward Data passing step 2 : create property of the protocol

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        var rollNumber = Int(self.rollNumberTextField.text!)
        var firstName = self.firstNameTextField.text
        var lastName = self.lastNameTextField.text
        
        var studentObject = Student(rollNumber: rollNumber!, firstName: firstName!, lastName: lastName!)
        
        guard let delegateSVC = delegate else { return  }
        
        //step 3 : pass student object to the method of that protocol
        delegateSVC.passDataToSecondViewController(student: studentObject)
        navigationController?.popViewController(animated: true)
    }
}
