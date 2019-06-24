//
//  ViewController.swift
//  pers
//
//  Created by 陈羽如 on 2019/4/19.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lineFields: [UITextField]!
    var dataDelegate: PersistenceDelegate = /*PlistManager.standard*/SQLiteManager.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var datas = dataDelegate.LoadData()
        var i = 0
        while(i<datas.count)
        {
            lineFields[i].text = datas[i]
            i = i + 1
        }
        
        //定义通知
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive), name: UIApplication.willResignActiveNotification, object: app)
    }
    
    @objc func applicationWillResignActive(notification: Notification){
        var datas:[String] = []
        for f in lineFields {
            datas.append(f.text!)
        }
        dataDelegate.SaveData(datas)
    }


}

