//
//  SecondViewController.swift
//  aaa
//
//  Created by 陈羽如 on 2019/4/26.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.loadFromNet(imageUrl: "http://news.whu.edu.cn/__local/2/69/91/EF449B6EF663025A8D81807BD0A_82327CF9_BA9A.jpg")
    }


}

