//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Mert Demirezen on 12/10/22.
//  Copyright © 2022 Mert Demirezen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var result : String?
    var pct : String?
    var splitNumber : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result ?? "0.0"
        settingLabel.text = "Split between \(splitNumber ?? "Null") people, with \(pct ?? "Null")% tip."
        
    }
    
    @IBAction func reCalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
