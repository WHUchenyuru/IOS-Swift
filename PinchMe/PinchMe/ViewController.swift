//
//  ViewController.swift
//  PinchMe
//
//  Created by 陈羽如 on 2019/5/19.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    private var imageView:UIImageView!
    private var scale = CGFloat(1)
    private var previousScale = CGFloat(1)
    private var rotation = CGFloat(0)
    private var previousRotation = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "1")
        imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        imageView.center = view.center
        view.addSubview(imageView)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        pinchGesture.delegate = self
        imageView.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(doRotate(_:)))
        rotationGesture.delegate = self
        imageView.addGestureRecognizer(rotationGesture)
        
    }
    
    func gestureRecognizer(_ gestureRecognizer:UIGestureRecognizer, shouldRecognizeSimultaneouslyWithotherGestureRecognizer:UIGestureRecognizer)->Bool{
        return true
    }
    
    func transformImageView(){
        var t = CGAffineTransform(scaleX: scale * previousScale, y: scale * previousScale)
        t = t.rotated(by: rotation + previousRotation)
        imageView.transform = t
    }

    @objc func doPinch(_ gesture:UIPinchGestureRecognizer){
        scale = gesture.scale
        transformImageView()
        if gesture.state == .ended{
            previousScale = scale * previousScale
            scale = 1
        }
    }
    
    @objc func doRotate(_ gesture:UIRotationGestureRecognizer){
        rotation = gesture.rotation
        transformImageView()
        if gesture.state == .ended{
            previousRotation = rotation + previousRotation
            rotation = 0
        }
    }
    

}

