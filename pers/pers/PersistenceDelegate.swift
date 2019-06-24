//
//  PersistenceDelegate.swift
//  pers
//
//  Created by 陈羽如 on 2019/4/19.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import Foundation

protocol PersistenceDelegate {
    func LoadData() ->[String]
    func SaveData(_ data:[String]) 
}
