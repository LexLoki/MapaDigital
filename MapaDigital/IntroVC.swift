//
//  IntroVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class IntroVC : RatioUIVC{
    
    private let time = NSTimeInterval(1.5)
    
    private let background = UIImageView(imageNamed: "intro_back")
    private let rect = UIView()
    private let explore = UIImageView(imageNamed: "intro_explore")
    
    var rectFrame : CGRect!
    //388 altura 460
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rect.alpha = 0.8
        rect.backgroundColor = UIColor.whiteColor()
        placeView.addSubview(background)
        placeView.addSubview(rect)
        placeView.addSubview(explore)
        background.frame.size = placeView.frame.size
        explore.frame.size = placeView.frame.size
        rectFrame = CGRectMake(0, 388/1080*placeView.frame.height, placeView.frame.width, 460/1080*placeView.frame.height)
        rect.frame = rectFrame
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        view.userInteractionEnabled = false
        animateTransition()
    }
    
    private func animateTransition(){
        let vc = MainMapVC()
        UIView.animateWithDuration(time, animations: {
            self.explore.alpha = 0
            self.rect.alpha = 1
            self.rect.frame = CGRect(origin: CGPointZero, size: self.placeView.frame.size)
            }) { (_) in
                self.presentViewController(vc, animated: false, completion: nil)
        }
    }
    
    func rollBack(){
        //self.dismissViewControllerAnimated(false, completion: nil)
        UIView.animateWithDuration(1.5, animations: {
            self.explore.alpha = 1
            self.rect.alpha = 0.8
            self.rect.frame = self.rectFrame
        }) { (_) in
            self.view.userInteractionEnabled = true
        }
    }
    
}
