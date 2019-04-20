//
//  MarqueeLabelViewController.swift
//  TuncatedText
//
//  Created by Rolf Locher on 2/17/19.
//  Copyright © 2019 Rolf Locher. All rights reserved.
//

import UIKit

class MarqueeLabelViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    
    @IBOutlet var label1LeadingStart: NSLayoutConstraint!
    
    @IBOutlet var label2: UILabel!
    
    
    
    
    
    var leftSide = NSLayoutConstraint()
    var rightSide = NSLayoutConstraint()
    var centerSide = NSLayoutConstraint()
    
    var leftSide2 = NSLayoutConstraint()
    var rightSide2 = NSLayoutConstraint()
    
    
    func animateCenter () {
        self.view.removeConstraint(self.rightSide)
        self.view.removeConstraint(self.leftSide)
        self.view.addConstraint(self.centerSide)
        self.view.layoutIfNeeded()
    }
    
    func animateLeft() {
        self.view.removeConstraint(self.centerSide)
        self.view.removeConstraint(self.rightSide)
        UIView.animate(withDuration: 5.0, animations: {
            self.view.addConstraint(self.leftSide)
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            self.animateRight()
            self.animateLeft()
        })
    }
    
    func animateRight() {
        self.view.removeConstraint(self.leftSide)
        self.view.removeConstraint(self.centerSide)
        //UIView.animate(withDuration: 5.0, animations: {
        self.view.addConstraint(self.rightSide)
        self.view.layoutIfNeeded()
        //}, completion: { (finished: Bool) in
        //    self.animateLeft()
        //}
        //)
    }
    
    func animateLabels () {
        
        self.label1LeadingStart.isActive = false
        //label1.center = CGPoint(x:0.0, y:0.0)
        
        animateCenter()
        
        self.label2.text = self.label1.text
        self.animateLabel2Right()
        self.label2.isHidden=false
        
        animateLeft()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            self.animateLabel2Left()
        }
        
        //animateRight()
        
        
    }
    
    func animateLabel2 () {
        
    }
    
    func animateLabel2Right () {
        self.view.removeConstraint(self.leftSide2)
        self.view.addConstraint(self.rightSide2)
        self.view.layoutIfNeeded()
        
    }
    
    func animateLabel2Left () {
        self.view.removeConstraint(self.rightSide2)
        
//        UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
//            self.view.addConstraint(self.leftSide2)
//            self.view.layoutIfNeeded()
//        }, completion: { (finished: Bool) in
//            self.animateLabel2Right()
//            self.animateLabel2Left()
//        }
//        )
        
        UIView.animate(withDuration: 5.0, animations: {
            self.view.addConstraint(self.leftSide2)
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            self.animateLabel2Right()
            self.animateLabel2Left()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label2.isHidden = true
        
        leftSide = NSLayoutConstraint(item: self.label1, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        rightSide = NSLayoutConstraint(item: self.label1, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        centerSide = NSLayoutConstraint(item: self.label1, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        leftSide2 = NSLayoutConstraint(item: self.label2, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        rightSide2 = NSLayoutConstraint(item: self.label2, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
