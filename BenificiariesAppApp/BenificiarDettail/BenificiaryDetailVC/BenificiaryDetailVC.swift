//
//  BenificiaryDetailVC.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/9/23.
//

import UIKit
import Combine

class BenificiaryDetailVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lblSSN: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    // MARK: - Data memebers
    var benificiaryDetail: Benificiary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        configUX()
    }
    
    private func configUX() {
        self.navigationItem.backButtonTitle = ""
        guard let benificiaryObj = benificiaryDetail else {
            return
        }
        lblSSN.text = benificiaryObj.socialSecurityNumber
        lblPhoneNumber.text = benificiaryObj.phoneNumber
        lblAddress.text = benificiaryObj.beneficiaryAddress?.firstLineMailing
        guard let dob = DateOfBirthformatter(dateObj: benificiaryObj.dateOfBirth!) else { return }
        lblDOB.text = dob
    }
    
    private func DateOfBirthformatter(dateObj: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        if let date = formatter.date(from: dateObj) {
            formatter.dateFormat = "MM/dd/yyyy"
            let formattedDate = formatter.string(from: date)
            return formattedDate
        }
        
        return nil
    }

}
