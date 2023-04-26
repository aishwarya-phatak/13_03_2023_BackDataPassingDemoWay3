//
//  ViewController.swift
//  13_03_2023_BackDataPassingDemoWay3
//
//  Created by Vishal Jagtap on 24/04/23.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var studentTableView: UITableView!
    var students : [Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        registerWithXIB()
    }
    
    @IBAction func btnAddStudent(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        secondViewController?.delegate = self   //step 6 : assign current instance of view controller to delegate property of SVC
        
        navigationController?.pushViewController(secondViewController!, animated: true)
    }
    
    func registerWithXIB(){
        let uiNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")
    }
}

//step 4 : conforming to BackDataPassing protocol
extension ViewController : BackDataPassing{
    //step 5 : implement method
    func passDataToSecondViewController(student: Student) {
        students.append(student)
        self.studentTableView.reloadData()
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as? StudentTableViewCell
        
        studentTableViewCell?.rollNumberLabel.text = String(students[indexPath.row].rollNumber)
        
        studentTableViewCell?.firstNameLabel.text = students[indexPath.row].firstName
        
        studentTableViewCell?.lastNameLabel.text =
        students[indexPath.row].lastName
        
        return studentTableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete){
            studentTableView.beginUpdates()
            studentTableView.deleteRows(at: [indexPath], with: .fade)
            students.remove(at: indexPath.row)
            studentTableView.endUpdates()
        }
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165.0
    }

    
}

