//
//  alterViewController.swift
//  MyApp
//
//  Created by 陈羽如 on 2019/6/13.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class alterViewController: UIViewController {
    @IBOutlet weak var sName: UILabel!
    @IBOutlet var studentInfos: [UITextField]!
    var studentName:String!
    var dataDelegate =  SQLiteManager.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sName.text = studentName
        let query = "select * from students where sname = '\(studentName!)'"
        var datas = dataDelegate.SearchData(query)
        var i = 0
        while(i<studentInfos.count)
        {
            studentInfos[i].text = datas[i+1]
            i = i + 1
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listVC = segue.destination as! StudentInfoViewController
        listVC.studentName = studentName
    }

    @IBAction func reserve_Pressed(_ sender: Any) {
        var datas:[String] = []
        for f in studentInfos {
            datas.append(f.text!)
        }
        
        let update = "update students set SNO = '\(datas[0])', SCOLLEGE = '\(datas[1])', SID = '\(datas[2])', SPLACE = '\(datas[3])' , SPHONE = '\(datas[4])', SMAIL = '\(datas[5])' where sname = '\(studentName!)';"
        if dataDelegate.execSql(update)
        {
            print("更新成功！")
        }
    }
}
