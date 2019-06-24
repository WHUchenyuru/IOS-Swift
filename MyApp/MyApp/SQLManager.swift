//
//  SQLManager.swift
//  MyApp
//
//  Created by 陈羽如 on 2019/6/14.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteManager{
    
    public static let standard = SQLiteManager()
    private var dbPath:String = ""
    private var database:OpaquePointer? = nil
    
    init()
    {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.first!.appendingPathComponent("data.sqlite3")
        dbPath = url.path
        let result = sqlite3_open(dbPath, &database)
        if result != SQLITE_OK{
            sqlite3_close(database)
            print("open database error")
        }
    }
    
    func LoadData() -> [String] {
        var students:[String] = []
        
        let createsql = "CREATE TABLE IF NOT EXISTS STUDENTS" + "(SNAME TEXT PRIMAYR KEY, SNO TEXT, SCOLLEGE TEXT, SID TEXT, SPLACE TEXT, SPHONE TEXT, SMAIL TEXT);"
        var errmsg:UnsafeMutablePointer<Int8>?=nil
        let result = sqlite3_exec(database, createsql, nil, nil, &errmsg)
        if result != SQLITE_OK{
            print("Create table error")
            return students
        }
        
        let query = "SELECT SNAME FROM STUDENTS;"
        var statment:OpaquePointer? = nil
        if sqlite3_prepare_v2(database, query, -1, &statment, nil) == SQLITE_OK
        {
            while sqlite3_step(statment) == SQLITE_ROW{
                let rowData = sqlite3_column_text(statment, 0)
                let fieldValue = String.init(cString: rowData!)
                students.append(fieldValue)
            }
            sqlite3_finalize(statment)
        }
        return students
    }
    
    func AddData(_ data: String, _ update:String) {
        var statement:OpaquePointer? = nil
        if sqlite3_prepare_v2(database, update, -1, &statement, nil) == SQLITE_OK{
            sqlite3_bind_text(statement, 1, data, -1, nil)
        }
        if sqlite3_step(statement) != SQLITE_DONE{
            print("insert or update error")
            return
        }
        sqlite3_finalize(statement)
    }
    
    func execSql(_ sql:String) -> Bool {
        let csql = sql.cString(using: String.Encoding.utf8)
        return sqlite3_exec(database, csql, nil, nil, nil) == SQLITE_OK
    }
       
    func SearchData( _ word:String) -> [String] {
        var students:[String] = []
        var statment:OpaquePointer? = nil
        if sqlite3_prepare_v2(database, word, -1, &statment, nil) == SQLITE_OK
        {
            if sqlite3_step(statment) == SQLITE_ROW{
                var rowData = sqlite3_column_text(statment, 0)
                var fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                rowData = sqlite3_column_text(statment, 1)
                fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                rowData = sqlite3_column_text(statment, 2)
                fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                rowData = sqlite3_column_text(statment, 3)
                fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                rowData = sqlite3_column_text(statment, 4)
                fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                rowData = sqlite3_column_text(statment, 5)
                fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                rowData = sqlite3_column_text(statment, 6)
                fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                students.append(fieldValue)
                sqlite3_finalize(statment)
            }else{
                print("查询失败")
            }
        }else{
            print("未准备好")
        }
        return students
    }
    
    func login(_ username:String)->String{
        let word = "select password from users where username = '\(username)'"
        var statment:OpaquePointer? = nil
        if sqlite3_prepare_v2(database, word, -1, &statment, nil) == SQLITE_OK
        {
            if sqlite3_step(statment) == SQLITE_ROW{
                let rowData = sqlite3_column_text(statment, 0)
                let fieldValue = rowData == nil ? " " : String.init( cString:rowData! )
                return fieldValue
            }
        }
        return "error"
    }
    
    deinit {
        self.closeDB()
    }
    func closeDB() -> Void {
        sqlite3_close(database)
    }
}


