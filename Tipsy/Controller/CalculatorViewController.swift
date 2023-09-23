//
//  ViewController.swift
//  Tipsy
//
//  Created by Mert Demirezen on 12/10/22.
//  Copyright © 2022 Mert Demirezen. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    var bill : Double?
    var tip = 0.10
    var resultS = ""
    var buttonTitleMinusPct = ""
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        //remove percentage
        buttonTitleMinusPct = String(buttonTitle.dropLast())
        tip  = (Double(buttonTitleMinusPct) ?? 0.0) / 100
        print(tip)
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        
    }
    @IBAction func calculatePressed(_ sender: Any) {
        billTextField.endEditing(true)
        bill = Double(billTextField.text ?? "0.0") ?? 0.0
        let result = ((bill! * tip) + bill!) / Double(splitNumberLabel.text!)!
        resultS = String(format: "%.2f", result)
        print(resultS)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.result = resultS
            destinationVc.pct = buttonTitleMinusPct
            destinationVc.splitNumber = splitNumberLabel.text
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
