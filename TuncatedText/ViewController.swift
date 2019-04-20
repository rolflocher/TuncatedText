//
//  ViewController.swift
//  TuncatedText
//
//  Created by Rolf Locher on 2/17/19.
//  Copyright © 2019 Rolf Locher. All rights reserved.
//

import UIKit


extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}


class ViewController: UIViewController {

    @IBOutlet var textEntryView: UITextField!
    
    
    
    var songName = String()
    
//    @IBAction func textEntryChanged(_ sender: Any) {
//
//        self.marqueeLabel.text = textEntryView.text
//
//        if self.marqueeLabel.bounds.size.width > 40  {
//            //let r = self.marqueeLabel.text!.removeFirst()
//            //let f = self.marqueeLabel.text!.removeFirst()
//            //self.marqueeLabel.text!.removeFirst()
//            //print(String((self.marqueeLabel.text?.dropFirst())!))
//            //self.marqueeLabel.text = String((self.marqueeLabel.text?.dropFirst())!)
//            while true {
//                self.textEntryView.text?.removeFirst()
//            }
//        }
//    }
    
    
    @IBAction func enteredName(_ sender: Any) {
        
        
        self.marqueeLabel.text = self.textEntryView.text! + "   "
        
        //print(self.marqueeLabel.text)
        //print(self.textEntryView.text)
        
        guard let locationController = children.first as? MarqueeLabelViewController else  {
            fatalError("Check storyboard for missing LocationTableViewController")
        }
        locationController.label1.text = self.textEntryView.text!
        locationController.animateLabels()
        
        var width = 100//self.marqueeLabel.bounds.size.width
        self.marqueeLabel.fadeTransition(0.5)
        //print(width)
        
        DispatchQueue.global(qos: .background).async {
            
        
            while width > 40  {
                DispatchQueue.main.async {
                    self.marqueeLabel.text = self.marqueeLabel.text! + String((self.marqueeLabel.text?.first)!)
                    self.songName = String((self.marqueeLabel.text?.dropFirst())!)
                    //print(self.songName)
                    //self.songName.dropFirst()
                    self.marqueeLabel.text = self.songName
                    
                }
                
                //print(self.marqueeLabel.text)
                width -= 1 //self.marqueeLabel.bounds.size.width
                print(width)
                usleep(300000)
                
            }
        }
        
    }
    
    
    
    @IBOutlet var marqueeLabel: UILabel!
    
    @IBOutlet var mainBlurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marqueeLabel.fadeTransition(0.4)
        mainBlurView.layer.cornerRadius = 10.0
        mainBlurView.clipsToBounds = true
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

