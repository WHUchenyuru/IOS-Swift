//
//  MainViewController.swift
//  ppp2
//
//  Created by 陈羽如 on 2019/5/8.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userinfo = AppArchiver.share.read()
        userName.text = userinfo?.userName
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
