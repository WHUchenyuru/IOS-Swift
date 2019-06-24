//
//  ViewController.swift
//  aaaab
//
//  Created by 陈羽如 on 2019/5/5.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var label:UILabel!
    private var animate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bounds = view.bounds
        
        let labelFrame = CGRect(origin: CGPoint(x: bounds.origin.x, y: bounds.midY-50), size: CGSize(width: bounds.size.width, height: 100))
        label = UILabel(frame: labelFrame)
        label.font = UIFont(name:"Helvetica", size:70)
        label.text = "Bazinga!"
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        view.addSubview(label)
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(ViewController.applicationWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        center.addObserver(self, selector: #selector(ViewController.applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func applicationWillResignActive(){
        print("VC:\(#function)")
        animate = false
    }
    
    @objc func applicationDidBecomeActive(){
        print("VC:\(#function)")
        animate = true
        rotateLabelDown()
    }
    
    func rotateLabelDown(){
        UIView.animate(withDuration: 0.5, animations: {self.label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))}, completion: {
            (Bool)-> Void in self.rotateLabelUp()
        })
    }
    
    func rotateLabelUp(){
        UIView.animate(withDuration: 0.5, animations: {self.label.transform = CGAffineTransform(rotationAngle: 0)}, completion: {(Bool)->Void in
            if self.animate{
                self.rotateLabelDown()
            }
        })
    }

    

}

