//
//  YellowViewController.swift
//  aaaaa
//
//  Created by 陈羽如 on 2019/3/20.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func yellowButtonPressed(sender: UIButton){
        let alert = UIAlertController(title: "yellow view Button Pressed",
                                      message:"You pressed the button on the yellow view",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"Yes, I did", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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
