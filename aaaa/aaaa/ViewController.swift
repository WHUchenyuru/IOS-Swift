//
//  ViewController.swift
//  aaaa
//
//  Created by 陈羽如 on 2019/4/24.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var lineFields:[UITextField]!
    
    private static let lineEntityName = "Line"
    private static let lineNumberKey = "lineNumber"
    private static let lineTextKey = "lineText"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.managedObjectContext
        
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: ViewController.lineEntityName)
        
        do{
            let objects = try context.fetch(request)
            for object in objects{
                let lineNum:Int = (object as AnyObject).value(forKey: ViewController.lineNumberKey)! as! Int
                let lineText:String = (object as AnyObject).value(forKey: ViewController.lineTextKey) as? String ?? ""
                let textfield = lineFields[lineNum]
                textfield.text = lineText
            }
        }
        catch{
            print("read error")
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillResignAction(notification:)), name: UIApplication.willResignActiveNotification, object: UIApplication.shared)
    }
    
    @objc func applicationWillResignAction(notification: NSNotification)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.managedObjectContext
        
        for i in 0..<lineFields.count{
            let textfield = lineFields[i]
            let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: ViewController.lineEntityName)
            
            let pred = NSPredicate(format: "%k = %d", ViewController.lineNumberKey, i)
            request.predicate = pred
            do{
                let objects = try context.fetch(request)
                var theLine:NSManagedObject! = objects.first as? NSManagedObject
                if theLine == nil{
                    
                }
                //fu zhi
            }
            catch{
                
            }
            appDelegate.saveContext()
        }
    }

    

}

