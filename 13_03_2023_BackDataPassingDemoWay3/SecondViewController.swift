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
  
    var dataSubmitAlert : UIAlertController?
    var actionSheetAlert : UIAlertController?
    var uiAlertAction : UIAlertAction?
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
        showAlertBeforeSubmittingData()
        //showActionSheetStyleAlert()
        navigationController?.popViewController(animated: true)
    }
    
    //Simple Alert and alert with more than two buttons
    func showAlertBeforeSubmittingData(){
        dataSubmitAlert = UIAlertController(
            title: "Check Before Submit",
            message: "Do really want to add a record?",
            preferredStyle: UIAlertController.Style.alert)
        uiAlertAction = UIAlertAction(
            title: "Yes",
            style: UIAlertAction.Style.default,handler:
                { _ in
                    print("Yes Action performed")
                })
        dataSubmitAlert?.addAction(uiAlertAction!)
        
        dataSubmitAlert?.addAction(
            UIAlertAction(
                title: "No",
                style: .default,handler: { _ in
                    print("No clikced")
                }))
        dataSubmitAlert?.addAction(UIAlertAction(
            title: "Not Sure",
            style: .default))
        
        self.present(dataSubmitAlert!, animated: true)
    }
    
    //Alert with desctructive action style
//    func showAlertBeforeSubmittingData(){
//        dataSubmitAlert = UIAlertController(
//            title: "Check Before Submit",
//            message: "Do really want to add a record?",
//            preferredStyle: UIAlertController.Style.alert)
//        uiAlertAction = UIAlertAction(
//            title: "Yes",
//            style: UIAlertAction.Style.default,handler:
//                { _ in
//                    print("Yes Action performed")
//                })
//        dataSubmitAlert?.addAction(uiAlertAction!)
//
//      dataSubmitAlert?.addAction(
//         UIAlertAction(
//              title: "No",
//              style: .destructive,handler: { _ in     //you check by adding cancel action style
//                    print("No clikced")
//                }))
//        self.present(dataSubmitAlert!, animated: true)
//    }
    
    //action sheet style alert
    func showActionSheetStyleAlert(){
        actionSheetAlert = UIAlertController(
            title: "About Record",
            message: "Do you want to add a record?",
            preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheetAlert?.addAction(UIAlertAction(
            title: "Edit",
            style: .default,handler: { _ in
                print("Edit Action selected")
            }))
        
        actionSheetAlert?.addAction(UIAlertAction(
            title: "Delete", style: .destructive,
            handler: { _ in
                print("Delete Action selected")
            }))
        
        actionSheetAlert?.addAction(UIAlertAction(
            title: "Cancel",
            style: .default,handler: { _ in
                print("Cancel Action selected")
            }
        ))
        
        actionSheetAlert?.addAction(UIAlertAction(
            title: "Dismiss",
            style: .cancel))
        
        self.present(actionSheetAlert!, animated: true)
    }
}
