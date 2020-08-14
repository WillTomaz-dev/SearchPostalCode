//
//  SearchViewController.swift
//  SearchPostalCode
//
//  Created by William Tomaz on 09/06/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tfPostalCode: UITextField!
    @IBOutlet weak var lbErrorMessage: UILabel!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfPostalCode.layer.borderColor = UIColor.black.cgColor
        tfPostalCode.layer.borderWidth = 1.0
        tfPostalCode.layer.cornerRadius = 6.0
        tfPostalCode.attributedPlaceholder = NSAttributedString(string: tfPostalCode.placeholder ?? "Vazio", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25.0)])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func Search(_ sender: UIButton) {
        validatePostalCode()
    }
    
    func validatePostalCode() {
        if tfPostalCode.text?.count != 8 {
            error()
        } else {
            aiLoading.startAnimating()
            SearchPostalCode.loadAdress(postalCode: tfPostalCode.text!) { (postalCode) in
                self.aiLoading.stopAnimating()
                guard let postalCode = postalCode else {
                    self.error()
                    return
                }
                self.performSegue(withIdentifier: "segue", sender: postalCode)
                self.clean()
            }
        }
    }
    
    func clean() {
        lbErrorMessage.isHidden = true
        aiLoading.stopAnimating()
        tfPostalCode.text?.removeAll()
        resignFirstResponder()
    }
    
    func error() {
        lbErrorMessage.isHidden = false
        lbErrorMessage.text = "CEP Inválido ou não encontrado"
        aiLoading.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SearchResultViewController
        if let postalCode = sender as? PostalCode {
            vc.postalCode = postalCode
        }
    }
}

extension UITextField {
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
