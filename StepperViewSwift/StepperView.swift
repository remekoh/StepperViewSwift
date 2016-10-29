//
//  StepperView.swift
//  StepperViewSwift
//
//  Created by rem{e}koh on 10/26/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

protocol StepperViewDelegate: class {
    
    func stepperViewDidValueChanged(_ value: Int)
}

class StepperView: UIView {
    
    weak var delegate: StepperViewDelegate!
    
    var steps: UILabel!
    var positiveButton: UIButton!
    var negativeButton: UIButton!
    var currentValue = 0
    
    override init(frame: CGRect){
        super.init(frame: frame)
//        currentValue = 0
        
        // + Button
        positiveButton = UIButton(type: .custom)
        positiveButton.backgroundColor = UIColor.gray
        positiveButton.setTitle("+", for: .normal)
        positiveButton.frame = CGRect(x: -10, y: 0, width: 50, height: 50)
        positiveButton.center = CGPoint(x: self.frame.size.width - 50, y: self.frame.size.height / 2)
        positiveButton.addTarget(self, action: #selector(self.plusButtonPressed), for: .touchUpInside)
        
        // - Button
        negativeButton = UIButton(type: .custom)
        negativeButton.backgroundColor = UIColor.gray
        negativeButton.setTitle("-", for: .normal)
        negativeButton.frame = CGRect(x: -10, y: 0, width: 50, height: 50)
        negativeButton.center = CGPoint(x: 50, y: self.frame.size.height / 2)
        negativeButton.addTarget(self, action: #selector(self.minusButtonPressed), for: .touchUpInside)
        
        //Label
        steps = UILabel()
        steps.text = "\(currentValue)"
        steps.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        steps.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        
        //Add buttons and label to view
        self.addSubview(positiveButton)
        self.addSubview(negativeButton)
        self.addSubview(steps)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    func plusButtonPressed(_ sender: Any) {
        currentValue+=1
        steps.text = "\(currentValue)"
        self.delegate.stepperViewDidValueChanged(currentValue)
    }
    
    func minusButtonPressed(_ sender: Any) {
        currentValue-=1
        steps.text = "\(currentValue)"
        self.delegate.stepperViewDidValueChanged(currentValue)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
