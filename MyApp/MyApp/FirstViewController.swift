//
//  FirstViewController.swift
//  MyApp
//
//  Created by 陈羽如 on 2019/4/27.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UISearchBar!
    @IBOutlet weak var select: UIButton!
    @IBOutlet weak var add: UIButton!
    private var students: [String]  = []
    var dataDelegate = SQLiteManager.standard
    private static let cellIdentifier = "students"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var datas = dataDelegate.LoadData()
        students.removeAll()
        var i = 0
        while(i<datas.count)
        {
            students.append(datas[i])
            i = i + 1
        }
        tableView.reloadData()
    }
    
    //点击查询按钮
    @IBAction func search_clicked(_ sender: UIButton) {
        let query = "SELECT SNAME FROM STUDENTS WHERE SNAME LIKE '\(textField.text!)';"
        var datas = dataDelegate.SearchData(query)
        students.removeAll()
        var i = 0
        while(i<datas.count)
        {
            students.append(datas[i])
            i = i + 1
        }
        tableView.reloadData()
    }
    //添加按钮
    @IBAction func add_clicked(_ sender: Any) {
        let update = "INSERT OR REPLACE INTO STUDENTS(SNAME) Values(?)"
        dataDelegate.AddData(textField.text!, update)
        var datas = dataDelegate.LoadData()
        students.removeAll()
        var i = 0
        while(i<datas.count)
        {
            students.append(datas[i])
            i = i + 1
        }
        tableView.reloadData()
    }
    //刷新页面
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //定义tableview列数及单元格
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewController.cellIdentifier)
        cell?.textLabel?.text = students[indexPath.row]
        return cell!
    }
    

    //子视图
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        let listVC = segue.destination as! StudentInfoViewController
        
        listVC.studentName = students[indexPath.row]
    }

}

