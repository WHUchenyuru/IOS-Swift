//
//  ViewController.swift
//  abc
//
//  Created by 陈羽如 on 2019/5/5.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.downloadAsyncForm(url: "https://pics6.baidu.com/feed/0b7b02087bf40ad1fe7f08a19f38d7dba8eccef7.jpeg?token=1f250e4277e8f08a8eb8fd5803ea19d5&s=6C521DC68C22A6CC52C5C99903009093")
    }

    

}

