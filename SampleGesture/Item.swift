//
//  Item.swift
//  SampleGesture
//
//  Created by le ha thanh on 7/15/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup(){
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(Item.onPan(_:)))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(Item.onPinch(_:)))
        self.addGestureRecognizer(pinchGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(Item.onRotation(_:)))
        rotationGesture.delegate = self
        self.addGestureRecognizer(rotationGesture)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    func onPan(panGesture: UIPanGestureRecognizer) {
        if panGesture.state == .Began || panGesture.state == .Changed {
            let point = panGesture.locationInView(self.superview)
            self.center = point
        }
        
    }
    func onPinch(sender : UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = CGAffineTransformScale(view.transform, sender.scale, sender.scale)
            sender.scale = 1
        }
    }
    
    func onRotation(sender1 : UIRotationGestureRecognizer) {
        if sender1.state == .Began || sender1.state == .Changed {
            if let view = sender1.view {
                view.transform = CGAffineTransformRotate(view.transform, sender1.rotation)
                sender1.rotation = 0
            }
        }
    }
}

