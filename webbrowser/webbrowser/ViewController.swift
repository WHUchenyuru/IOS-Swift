//
//  ViewController.swift
//  webbrowser
//
//  Created by 陈羽如 on 2019/3/20.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var webbs: WKWebView!
   
    @IBAction func enterpress(_ sender: UITextField) {
        let urlstr = sender.text
        let url = URL(string: urlstr!)
        let req = URLRequest(url:url!)
        webbs.load(req)
    }
    
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
        let tag = sender.tag
        switch tag{
        case 1:
            webbs.goBack()
        case 2:
            webbs.goForward()
        case 3:
            webbs.reload()
        default:
            break
        }
    }
    
}

