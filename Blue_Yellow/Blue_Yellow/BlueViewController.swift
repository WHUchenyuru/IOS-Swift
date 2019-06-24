//
//  ViewController.swift
//  aaaaa
//
//  Created by 陈羽如 on 2019/3/20.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func blueButtonPressed(sender: UIButton){
        let alert = UIAlertController(title: "Blue view Button Pressed",
                                      message:"You pressed the button on the blue view",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"Yes, I did", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

