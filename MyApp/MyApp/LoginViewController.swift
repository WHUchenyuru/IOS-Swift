//
//  LoginViewController.swift
//  MyApp
//
//  Created by 陈羽如 on 2019/6/16.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var dataDelegate = SQLiteManager.standard
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let createTable = "create table if not exists users (username text, password text);"
        if dataDelegate.execSql(createTable){
        }
        var insertData = "insert or replace into users values('Cyr', '123456');"
        if dataDelegate.execSql(insertData){
        }
        insertData = "insert or replace into users values('Gyt', '123456');"
        dataDelegate.execSql(insertData)
        insertData = "insert or replace into users values('Csy', '123456');"
        dataDelegate.execSql(insertData)
        insertData = "insert or replace into users values('Ct', '123456');"
        dataDelegate.execSql(insertData)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let real = dataDelegate.login(userName.text!)
        if real == password.text!
        {
            segue.perform()
        }
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
