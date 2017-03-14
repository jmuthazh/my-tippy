//
//  SettingsViewController.swift
//  tippy
//
//  Created by Jayakesavan Muthazhagan on 3/13/17.
//  Copyright © 2017 Jayakesavan Muthazhagan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var defaultTipText: UITextField!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let defaults = UserDefaults.standard
    
    @IBAction func saveValue(_ sender: Any) {
        save(sender)
    }
    
    func save(_ sender: Any) {
        defaults.set(defaultTipText, forKey: "defaultTipCustom" )
       
        defaults.synchronize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ViewController = segue.destination as! ViewController
        DestViewController.tipLabel.text = defaultTipText.text
    
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
