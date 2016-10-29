//
//  ViewController.swift
//  StepperViewSwift
//
//  Created by rem{e}koh on 10/26/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,StepperViewDelegate {
    
    weak var displayLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stepperView = StepperView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        stepperView.delegate = self
        stepperView.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(stepperView)
        
         //Center
        let center = self.view.center
        stepperView.center = center
        
        
    }
    
    func stepperViewDidValueChanged(_ value: Int) {
        self.displayLabel?.text! = "\(value)"
    }
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

