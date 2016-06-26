//
//  RuinVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class RuinVC : RatioUIVC{
    
    let imgView = UIImageView(imageNamed: "ruin_map")
    let button = UIButton() //1253 688
    let back_button = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        placeView.addSubview(imgView)
        imgView.frame.size = placeView.frame.size
        
        var img = UIImage(named: "ruin_b")!
        button.setImage(img, forState: .Normal)
        let s = GlobalData.getScale()
        button.frame = CGRectMake(1253*s, 688*s, img.size.width*s, img.size.height*s)
        let t = UIImageView(imageNamed: "ruin_t"); t.frame.size = button.frame.size; button.addSubview(t)
        
        img = UIImage(named: "map_back")!
        back_button.setImage(img, forState: .Normal)
        back_button.frame = CGRectMake(67*s, 981*s, img.size.width*s, img.size.height*s)
        
        placeView.addSubview(button)
        placeView.addSubview(back_button)
        back_button.addTarget(self, action: #selector(RuinVC.back), forControlEvents: .TouchUpInside)
        button.addTarget(self, action: #selector(RuinVC.go), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        placeView.alpha = 0
        view.userInteractionEnabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.4, animations: {
            self.placeView.alpha = 1
        }) { (_) in
            self.view.userInteractionEnabled = true
        }
    }
    
    func back(){
        placeView.runAnimation(UIAnimation.fadeOutWithDuration(0.4)) {
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    func go(){
        presentViewController(EventPageVC(
            overlayImg: "ruin-fixo",
            imgs: ["ruinas-foto-1","ruinas-foto-2","ruinas-foto-3","ruinas-foto-4"],
            texts: ["ruinas-texto-1","ruinas-texto-2","ruinas-texto-3","ruinas-texto-4"]
            ),animated: true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
}