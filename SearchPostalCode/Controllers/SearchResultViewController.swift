//
//  SearchResultViewController.swift
//  SearchPostalCode
//
//  Created by William Tomaz on 09/06/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var lbPostalCode: UILabel!
    @IBOutlet weak var lbStreet: UILabel!
    @IBOutlet weak var lbDistrict: UILabel!
    @IBOutlet weak var lbState: UILabel!
    @IBOutlet weak var lbUF: UILabel!
    
    var postalCode: PostalCode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(postalCode)
        showAdress()
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAdress() {
        lbPostalCode.text = postalCode.cep
        lbStreet.text = postalCode.logradouro
        lbDistrict.text = postalCode.bairro
        lbState.text = postalCode.localidade
        lbUF.text = postalCode.uf
    }
    
}
