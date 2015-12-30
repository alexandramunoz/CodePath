//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Alexandra Munoz on 12/29/15.
//  Copyright © 2015 Alexandra Munoz. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tipWordLabel: UILabel!
    @IBOutlet weak var peopleInPartyWordLabel: UILabel!
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        countLabel.text = "1"
        countStepper.minimumValue = 1
        countStepper.wraps = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        totalLabel.hidden = true
        tipLabel.hidden = true
        countStepper.hidden = true
        tipControl.hidden = true
        countLabel.hidden = true
        tipWordLabel.hidden = true
        peopleInPartyWordLabel.hidden = true
        totalPerPersonLabel.hidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
       billField.becomeFirstResponder()
       billField.placeholder = "$"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        
    }
    
    @IBAction func onValueChanged(sender: UIStepper) {
        countLabel.text = Int(sender.value).description
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount =  NSString(string: billField.text!).doubleValue
        
        var tip = billAmount * tipPercentage
        
        var total = (billAmount + tip)/countStepper.value
        
        totalLabel.text = "$\(total)"
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        if(billField.text == ""){
            billField.placeholder = "$"
        }
        billField.center = CGPointMake(200, 100)
        totalLabel.hidden = false
        tipLabel.hidden = false
        countStepper.hidden = false
        tipControl.hidden = false
        countLabel.hidden = false
        tipWordLabel.hidden = false
        peopleInPartyWordLabel.hidden = false
        totalPerPersonLabel.hidden = false
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount =  NSString(string: billField.text!).doubleValue
        
        var tip = billAmount * tipPercentage
        
        var total = (billAmount + tip)/countStepper.value
        
        tipLabel.text = "$\(tip)"
        
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
        
    }
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
}


