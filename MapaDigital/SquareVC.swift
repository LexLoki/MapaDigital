//
//  SquareVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class SquareVC : RatioUIVC{
    
    let imgView = UIImageView(imageNamed: "square_map") //named later
    let button = UIButton() //1459, 468
    let back_button = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        placeView.addSubview(imgView)
        imgView.frame.size = placeView.frame.size
        
        var img = UIImage(named: "square_b")!
        button.setImage(img, forState: .Normal)
        let s = GlobalData.getScale()
        button.frame = CGRectMake(1459*s, 468*s, img.size.width*s, img.size.height*s)
        let t = UIImageView(imageNamed: "square_t"); t.frame.size = button.frame.size; button.addSubview(t)
        
        img = UIImage(named: "map_back")!
        back_button.setImage(img, forState: .Normal)
        back_button.frame = CGRectMake(67*s, 981*s, img.size.width*s, img.size.height*s)
        
        placeView.addSubview(button)
        placeView.addSubview(back_button)
        back_button.addTarget(self, action: #selector(SquareVC.back), forControlEvents: .TouchUpInside)
        button.addTarget(self, action: #selector(SquareVC.go), forControlEvents: .TouchUpInside)
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
            overlayImg: "galeria-tunel-fixo",
            imgs: ["galeria-tunel-foto-1","galeria-tunel-foto-2","galeria-tunel-foto-3"],
            texts: ["galeria-tunel-texto-1","galeria-tunel-texto-2","galeria-tunel-texto-3"]
        ),animated: true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
}