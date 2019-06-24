//
//  SecondViewController.swift
//  MyApp
//
//  Created by 陈羽如 on 2019/4/27.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet var labels: [UILabel]!
    var dataDelegate = SQLiteManager.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let createTable = "create table if not exists grade (sname text, math text, english text, ios text, c text, physics text, linear text);"
        if dataDelegate.execSql(createTable){
            print("创建成功！")
        }
        var insertData = "insert or replace into grade values('Cyr', '96', '91', '92', '90', '90', '90');"
        if dataDelegate.execSql(insertData){
            print("插入成功！")
        }
        insertData = "insert or replace into grade values('Gyt', '97', '90', '93', '92', '90', '91');"
        dataDelegate.execSql(insertData)
        insertData = "insert or replace into grade values('Csy', '95', '92', '90', '93', '92', '91');"
        dataDelegate.execSql(insertData)
        insertData = "insert or replace into grade values('Ct', '94', '95', '98', '94', '92', '90');"
        dataDelegate.execSql(insertData)
    }
   
    @IBAction func button_Pressed(_ sender: Any) {
        let query = "select * from grade where sname = '\(searchbar.text!)'"
        var Grades = dataDelegate.SearchData(query)
        var i = 0
        while(i<Grades.count)
        {
            labels[i].text = Grades[i]
            i = i + 1
        }
    }
    
}

