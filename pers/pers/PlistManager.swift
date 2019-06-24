//
//  PlistManager.swift
//  pers
//
//  Created by 陈羽如 on 2019/4/19.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import Foundation

class PlistManager: PersistenceDelegate{
    
    public static let standard = PlistManager()
    private var fileURL: URL
    
    init(){
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        fileURL = urls.first!.appendingPathComponent("data.plist")
    }
    
    func LoadData() -> [String] {
        if(FileManager.default.fileExists(atPath: fileURL.path)){
            if let array = NSArray(contentsOf: fileURL) as? [String]{
                return array
            }
        }
        return []
    }
    
    func SaveData(_ data: [String]) {
        let array = data as NSArray
        array.write(to: fileURL, atomically: true)
    }
    
    
}
