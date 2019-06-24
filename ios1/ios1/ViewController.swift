//
//  ViewController.swift
//  ios1
//
//  Created by 陈羽如 on 2019/2/27.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isInputDigit = false
    var lastData : Double = 0
    var optStr : String = ""
    var curData : Double
    {
        get{
            return Double.init(lbDisplayData.text!)!
        }
        set{
            lbDisplayData.text = "\(newValue)"
        }
    }
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isInputDigit
        {
            if digit == "."
            {
                if lbDisplayData.text!.contains(".")
                {
                    lbDisplayData.text = "wrong"
                    isInputDigit = false
                }
                else
                {
                    lbDisplayData.text = lbDisplayData.text! + digit
                }
            }
            else{
                lbDisplayData.text = lbDisplayData.text! + digit
            }
        }
        else
        {
            lbDisplayData.text = digit
            isInputDigit = true
        }
    }
    
    @IBAction func deleteDigit(_ sender: UIButton) {
        if isInputDigit && !(lbDisplayData.text!.isEmpty)
        {
            let index:Int = (lbDisplayData.text?.count)!
            lbDisplayData.text = String.init(lbDisplayData.text!.prefix(index - 1))
        }
        else
        {
            lbDisplayData.text = "wrong"
            isInputDigit = false
        }
    }
    
    @IBOutlet weak var lbDisplayData: UILabel!
    @IBAction func appendOpt(_ sender: UIButton) {
        lastData = curData
        optStr = sender.currentTitle!
        isInputDigit = false
    }
    
    @IBAction func doOpt() {
        switch optStr
        {
        case "×": performCalTow(*)
        case "+": performCalTow(+)
        case "-": performCalTow(-)
        case "÷": performCalTow(/)
        case "√": performCalOne(sqrt)
        case "1/x":curData = 1/lastData
        default: break
        }
    }
    func performCalTow(_ op:(Double,Double)->Double)->Void
    {
        curData = op(lastData,curData)
    }
    func performCalOne(_ op:(Double)->Double)->Void
    {
        curData = op(lastData)
    }
}

