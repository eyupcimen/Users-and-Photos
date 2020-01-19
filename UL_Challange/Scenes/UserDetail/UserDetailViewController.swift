//
//  UserDetailViewController.swift
//  UL_Challange
//
//  Created by eyup cimen on 18.01.2020.
//  Copyright © 2020 eyup cimen. All rights reserved.
//

import UIKit

class UserDetailViewController: BaseViewController {
    
    var viewModel : UserDetailViewModel!
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var phoneLbl: UILabel!
    @IBOutlet var websiteLbl: UILabel!
    @IBOutlet var companyNameLbl: UILabel!
    @IBOutlet var companyCatchPhraseLbl: UILabel!
    @IBOutlet var companyBsLbl: UILabel!
    @IBOutlet var streetLbl: UILabel!
    @IBOutlet var suiteLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var zipCodeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillUserInfo(viewModel.user)
    }
    
    func fillUserInfo ( _ user : UserObject ) {
        nameLbl.text = viewModel.user.name
        usernameLbl.text = viewModel.user.username
        emailLbl.text = viewModel.user.email
        phoneLbl.text = viewModel.user.phone
        websiteLbl.text = viewModel.user.website
        
        companyNameLbl.text = viewModel.user.company.name
        companyCatchPhraseLbl.text = viewModel.user.company.catchPhrase
        companyBsLbl.text = viewModel.user.company.bs
        streetLbl.text = viewModel.user.address.street
        suiteLbl.text = viewModel.user.address.suite
        cityLbl.text = viewModel.user.address.city
        zipCodeLbl.text = viewModel.user.address.zipcode
    }
    
    @IBAction func showInMap(_ sender: UIButton) {
        let mapVC = UserDetailBuilder.makeMap(viewModel.user)
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @IBAction func userPostsAction(_ sender: UIButton) {
        let userPostVC = UserPostsBuilder.makePostList(viewModel.user.id)
        self.navigationController?.pushViewController(userPostVC, animated: true)
    }
}
