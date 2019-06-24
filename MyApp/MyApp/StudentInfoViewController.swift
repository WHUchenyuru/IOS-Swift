//
//  StudentInfoViewController.swift
//  MyApp
//
//  Created by 陈羽如 on 2019/6/13.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class StudentInfoViewController: UIViewController {
    @IBOutlet var studentInfos: [UILabel]!
    @IBOutlet weak var delete: UIButton!
    var dataDelegate = SQLiteManager.standard
    var studentName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        studentInfos[0].text = studentName
        let query = "select * from students where sname = '\(studentName!)'"
        var datas = dataDelegate.SearchData(query)
        for i in 1..<studentInfos.count{
            studentInfos[i].text = datas[i]
        }
    }
    
    @IBAction func delete_Pressed(_ sender: Any) {
        let word = "delete from students where sname = '\(studentName!)';"
        if dataDelegate.execSql(word){
            print("exec success!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "alter"){
            let listVC = segue.destination as! alterViewController
            listVC.studentName = studentName
        }
    }
    
}
