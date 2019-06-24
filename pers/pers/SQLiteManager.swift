//
//  SQLiteManager.swift
//  pers
//
//  Created by 陈羽如 on 2019/4/19.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import Foundation
import SQLite3

class SQLiteManager: PersistenceDelegate{
    
    public static let standard = SQLiteManager()
    private var dbPath:String = ""
    
    init(){
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.first!.appendingPathComponent("data.sqlite3")
        dbPath = url.path
    }
    
    func LoadData() -> [String] {
        var dataList:[String] = []
        
        var database:OpaquePointer? = nil
        var result = sqlite3_open(dbPath, &database)
        if result != SQLITE_OK{
            sqlite3_close(database)
            print("open database error")
            return dataList
        }
        
        let createsql = "Create Table If Not Exists Fields(Row Integer Primary Key, Field_Data Text);"
        var errmsg:UnsafeMutablePointer<Int8>?=nil
        result = sqlite3_exec(database, createsql, nil, nil, &errmsg)
        if result != SQLITE_OK{
            sqlite3_close(database)
            print("Create table error")
            return dataList
        }
        
        let query = "Select Field_Data From Fields Order by row"
        var statment:OpaquePointer? = nil
        if sqlite3_prepare_v2(database, query, -1, &statment, nil) == SQLITE_OK
        {
            while sqlite3_step(statment) == SQLITE_ROW{
                let rowData = sqlite3_column_text(statment, 0)
                let fieldValue = String.init(cString: rowData!)
                dataList.append(fieldValue)
            }
            sqlite3_finalize(statment)
        }
        sqlite3_close(statment)
        return dataList
    }
    
    func SaveData(_ data: [String]) {
        var database:OpaquePointer? = nil
        let result = sqlite3_open(dbPath, &database)
        if result != SQLITE_OK{
            sqlite3_close(database)
            print("open database error")
            return
        }
        for i in 0..<data.count{
            let field_data = data[i]
            let update = "Insert or Replace Into Fields(row, Field_Data)Values( ?, ?)"
            var statement:OpaquePointer? = nil
            if sqlite3_prepare_v2(database, update, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_int(statement, 1, Int32(i))
                sqlite3_bind_text(statement, 2, field_data, -1, nil)
            }
            if sqlite3_step(statement) != SQLITE_DONE{
                sqlite3_close(database)
                print("insert or update error")
                return
            }
            sqlite3_finalize(statement)
        }
        sqlite3_close(database)
        
    }
    
}
