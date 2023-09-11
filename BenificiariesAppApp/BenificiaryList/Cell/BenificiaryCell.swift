//
//  BenificiaryCell.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/9/23.
//

import UIKit

class BenificiaryCell: UITableViewCell {

    
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLasttName: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var outerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.layer.borderWidth = 1.0
        outerView.layer.borderColor = UIColor.lightGray.cgColor
        outerView.layer.cornerRadius = 10.0
        outerView.layer.shadowOpacity = 0.4
        outerView.layer.shadowRadius = 10.0
        outerView.layer.shadowColor = UIColor.darkGray.cgColor
        outerView.layer.shadowOffset = CGSize(width: 1.0, height: 5.0)
        let shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: 10.0).cgPath

        outerView.layer.shadowPath = shadowPath
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(benificiaryObj: Benificiary ) {
        lblFirstName.text = benificiaryObj.firstName
        lblLasttName.text = benificiaryObj.lastName
        lblDesignation.text = benificiaryObj.designationCode == "P" ? "Primary" : "Contingent"
    }
}
