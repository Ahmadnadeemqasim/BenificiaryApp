//
//  ViewController.swift
//  BenificiariesAppApp
//
//  Created by Ahmad Qasim on 9/8/23.
//

import UIKit
import Combine
//import ANActivityIndicator

class BenificiaryVC: UIViewController {

    // MARK: - outLet
    @IBOutlet weak var tblBenificiary: UITableView!
    
    // MARK: - Data memebers
    private var subscriptions: Set<AnyCancellable> = .init()
    var viewModel: BenificiaryVM?
    var router: BenificiaryRouter?
    var benificiaryList: [Benificiary]?
    
    // MARK: - memebers functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        title = "Benificiaries List"
        self.navigationItem.backButtonTitle = ""
//        tblBenificiary.delegate = self
//        tblBenificiary.dataSource = self
        let jsonParser = JsonPareser()
        self.router = BenificiaryRouter()
        router?.viewController = self
        viewModel = BenificiaryVM(jsonParser: jsonParser)
        viewModel?.getData()
    }
    
    func bindViews() {
        guard let viewModel = viewModel else { return }
         viewModel.$isSuccess.receive(on: DispatchQueue.main).dropFirst().sink(receiveValue: { [unowned self] isSuccess in
             if isSuccess {
                 reloadTableViewData()
             } else {
                print("Data not loaded")
             }
         }).store(in: &subscriptions)
    }
    private func reloadTableViewData(){
        self.tblBenificiary.reloadData()
    }
}

extension BenificiaryVC: UITabBarDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let benificiaryDetail = self.viewModel?.benificiaryList?[indexPath.row]
        router?.route(to: BenificiaryRoute.benificiaryDetail.rawValue, parameters: benificiaryDetail)
    }
}

// MARK: - Data Source delegates
extension BenificiaryVC: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let benificiaryCount = self.viewModel?.benificiaryList?.count else {
            return 0
        }
        return benificiaryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tblBenificiary.dequeueReusableCell(withIdentifier: "BenificiaryCell", for: indexPath) as? BenificiaryCell , let benificiaryObj =  self.viewModel?.benificiaryList?[indexPath.row]  else {
            return UITableViewCell()
        }
        
        cell.configCell(benificiaryObj: benificiaryObj)
        cell.selectionStyle = .none
        return cell
    }
    

    
}
