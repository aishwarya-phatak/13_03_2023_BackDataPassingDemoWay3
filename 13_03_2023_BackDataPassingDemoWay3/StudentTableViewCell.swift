//
//  StudentTableViewCell.swift
//  13_03_2023_BackDataPassingDemoWay3
//
//  Created by Vishal Jagtap on 24/04/23.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    @IBOutlet weak var rollNumberLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
}
