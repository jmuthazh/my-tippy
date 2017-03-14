//
//  ViewController.swift
//  tippy
//
//  Created by Jayakesavan Muthazhagan on 3/12/17.
//  Copyright © 2017 Jayakesavan Muthazhagan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
        @IBOutlet weak var billField: UITextField!
    var defaultSet : Bool = true
    var intValue : Double = 0.0
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        intValue = Double(tipLabel.text!) ?? 0
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateTip(_ sender: Any) {
       
        if defaultSet {
            defaults.set(10, forKey: "defaultTipCustom")
            defaults.synchronize()
        }
        
      
        var tipPercent = [0.18,0.2,0.25]
        let bill = Double(billField.text!) ?? 0
        var tip : Double
        let defaultTip = intValue * 0.01
        if defaultSet {
            tip = bill * (defaultTip)
            print("defaultTip:",defaultTip)
        } else {
             tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        }
        
        
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func tipChange(_ sender: Any) {
        calculateTip(sender)
        defaultSet = false
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    
}

