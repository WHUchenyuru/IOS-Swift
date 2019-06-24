//
//  ViewController.swift
//  aaaaa
//
//  Created by 陈羽如 on 2019/5/15.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer)
    {
        imageView.frame = view.frame
    }
    
}

