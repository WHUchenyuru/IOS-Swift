//
//  DrawUIView.swift
//  aaaaa
//
//  Created by 陈羽如 on 2019/5/15.
//  Copyright © 2019 陈羽如. All rights reserved.
//

import UIKit

class DrawUIView: UIView {

    private var firstTouchLocation = CGPoint.zero
    private var lastTouchLocation = CGPoint.zero
    private var currentRect = CGRect.zero
    private var redrawRect = CGRect.zero
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstTouchLocation = (touches.first?.location(in: self))!
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchLocation = (touches.first?.location(in: self))!
        currentRect = CGRect(x: firstTouchLocation.x, y: firstTouchLocation.y, width: lastTouchLocation.x - firstTouchLocation.x, height: lastTouchLocation.y - firstTouchLocation.y)
        
        redrawRect = redrawRect.union(currentRect)
        setNeedsDisplay(redrawRect)
    }
    
    
    
    override func draw(_ rect: CGRect)
    {
        let conext = UIGraphicsGetCurrentContext()
        
        conext?.setLineWidth(2.0)
        conext?.setStrokeColor(UIColor.magenta.cgColor)
        conext?.setFillColor(UIColor.cyan.cgColor)
        
        conext?.addRect(currentRect)
        conext?.addEllipse(in: currentRect)
        
        conext?.drawPath(using: .fillStroke)
    }

}
