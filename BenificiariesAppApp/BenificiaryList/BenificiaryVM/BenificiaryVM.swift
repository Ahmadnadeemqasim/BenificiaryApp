//
//  BenificiaryVM.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/10/23.
//

import Foundation
import Combine

final class BenificiaryVM {
    
    
    // MARK: - Data members
    @Published var isSuccess: Bool = false
    var benificiaryList: [Benificiary]?
    private let jsonParser: JsonPareser
    
    init(jsonParser: JsonPareser){
        self.jsonParser = jsonParser
    }
    
    func getData() {
        let fileName = "Beneficiaries"
        benificiaryList = jsonParser.parseJson(fileName: fileName)
        isSuccess = true
    }
    
}
