//
//  ViewController.swift
//  Tipster
//
//  Created by Peisure on 1/10/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tip = 5.0
    
    @IBOutlet var tip1: UILabel!
    @IBOutlet var tip2: UILabel!
    @IBOutlet var tip3: UILabel!
    @IBOutlet var tipa1: UILabel!
    @IBOutlet var tipa2: UILabel!
    @IBOutlet var tipa3: UILabel!
    @IBOutlet var tipt1: UILabel!
    @IBOutlet var tipt2: UILabel!
    @IBOutlet var tipt3: UILabel!
    @IBOutlet var group: UILabel!
    
    @IBOutlet var totalLabel: UILabel!
    @IBAction func addValue(_ sender:UIButton){
        if sender.tag == 11 {
            totalLabel.text="0"
            self.loadView()
        }
        else if sender.tag == 12{
            totalLabel.text! += "."
            sender.isEnabled = false
        }
        else{
            if totalLabel.text == "0"{
                totalLabel.text = String(sender.tag)
            }
            else{
                totalLabel.text! += String(sender.tag)
            }
            caculateTip()
        }
    }
    @IBAction func tipslider(_ sender: UISlider) {
        tip = Double(roundf(sender.value))
        tip1.text = String(Int(tip))+"%"
        tip2.text = String(Int(tip+10.0))+"%"
        tip3.text = String(Int(tip+15.0))+"%"
        caculateTip()
    }
    
    @IBAction func groupby(_ sender: UISlider) {
        group.text = "Group Size: \(String(Int(roundf(sender.value))))"
        if let inputNum=Double(totalLabel.text!){
            tipa1.text = String(format: "%.2f", inputNum * tip/100.0/Double(sender.value))
            tipa2.text = String(format: "%.2f", inputNum * (tip/100.0 + 0.1)/Double(sender.value))
            tipa3.text = String(format: "%.2f", inputNum * (tip/100.0 + 0.15)/Double(sender.value))
            tipt1.text = String(format: "%.2f", (inputNum * tip/100.0 + inputNum)/Double(sender.value))
            tipt2.text = String(format: "%.2f", (inputNum * (tip/100.0 + 0.1) + inputNum)/Double(sender.value))
            tipt3.text = String(format: "%.2f", (inputNum * (tip/100.0 + 0.15) + inputNum)/Double(sender.value))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func caculateTip(){
        if let inputNum=Double(totalLabel.text!){
            tipa1.text = String(format: "%.2f", inputNum * tip/100.0)
            tipa2.text = String(format: "%.2f", inputNum * (tip/100.0 + 0.1))
            tipa3.text = String(format: "%.2f", inputNum * (tip/100.0 + 0.15))
            tipt1.text = String(format: "%.2f", inputNum * tip/100.0 + inputNum)
            tipt2.text = String(format: "%.2f", inputNum * (tip/100.0 + 0.1) + inputNum)
            tipt3.text = String(format: "%.2f", inputNum * (tip/100.0 + 0.15) + inputNum)
        }
    }

}

