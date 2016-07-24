//
//  ViewController.swift
//  SampleGesture
//
//  Created by le ha thanh on 7/15/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.onTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    func onTap(tapGesture: UITapGestureRecognizer){
        let point = tapGesture.locationInView(self.view)
        let snowFlake = UIImageView(image: UIImage(named: "heart"))
        snowFlake.bounds.size = CGSize(width: 40, height: 40)
        snowFlake.center = point
        self.view.addSubview(snowFlake)
    }
    
    
}

