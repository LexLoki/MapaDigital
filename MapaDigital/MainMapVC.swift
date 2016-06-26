//
//  MainMapVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class MainMapVC : RatioUIVC{
    
    private let totalTime = CGFloat(0.8)
    
    let ruinButton = UIButton() //1475 355 //376, 138
    let galeryButton = UIButton() //1383 504 //467, 149
    let squareButton = UIButton() //1001 836 //485, 158
    let backButton = UIButton()
    let buttons : [UIButton]
    
    var squareParts : [UIImageView]!
    var ruinParts : [UIImageView]!
    var restParts : [UIImageView]!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        buttons = [ruinButton,galeryButton,squareButton,backButton]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ruinButton.setImage(UIImage(named: "map_b_ruin"), forState: .Normal)
        galeryButton.setImage(UIImage(named: "map_b_galery"), forState: .Normal)
        squareButton.setImage(UIImage(named: "map_b_square"), forState: .Normal)
        backButton.setImage(UIImage(named: "map_back"), forState: .Normal)
        
        let s = GlobalData.getScale()
        ruinButton.frame.size = CGSizeMake(376*s, 138*s)
        galeryButton.frame.size = CGSizeMake(467*s, 149*s)
        squareButton.frame.size = CGSizeMake(485*s, 158*s)
        backButton.frame.size = s*backButton.imageView!.image!.size
        
        var t = UIImageView(imageNamed: "map_t_ruin"); t.frame.size = ruinButton.frame.size; ruinButton.addSubview(t)
        t = UIImageView(imageNamed: "map_t_galery"); t.frame.size = galeryButton.frame.size; galeryButton.addSubview(t)
        t = UIImageView(imageNamed: "map_t_square"); t.frame.size = squareButton.frame.size; squareButton.addSubview(t)
        
        squareParts = loadParts([1,2,3,9,10,12,18,19,20])
        ruinParts = loadParts([11,13,14,15,16,17])
        restParts = loadParts([4,5,6,7,8,21,22])
        
        placeView.addSubview(ruinButton)
        placeView.addSubview(galeryButton)
        placeView.addSubview(squareButton)
        placeView.addSubview(backButton)
        
        ruinButton.addTarget(self, action: #selector(MainMapVC.goToRuin), forControlEvents: .TouchUpInside)
        squareButton.addTarget(self, action: #selector(MainMapVC.goToSquare), forControlEvents: .TouchUpInside)
        backButton.addTarget(self, action: #selector(MainMapVC.back), forControlEvents: .TouchUpInside)
    }
    
    private func loadParts(indexes : [Int])->[UIImageView]{
        var arr = [UIImageView]()
        for i in indexes{
            let img = UIImageView(imageNamed: "mapa_\(i)")
            img.frame.size = placeView.frame.size
            placeView.addSubview(img)
            arr.append(img)
        }
        return arr
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        placeView.alpha = 0
        for v in placeView.subviews{
            v.frame.origin = CGPointZero
        }
        let s = GlobalData.getScale()
        ruinButton.frame.origin = CGPointMake(1475*s, 355*s)
        galeryButton.frame.origin = CGPointMake(1383*s, 504*s)
        squareButton.frame.origin = CGPointMake(1001*s, 836*s)
        backButton.frame.origin = CGPointMake(67*s, 981*s)
        for v in buttons{
            v.alpha = 1
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        placeView.runAnimation(UIAnimation.fadeInWithDuration(0.7))
        view.userInteractionEnabled = true
    }
    
    func goToRuin(){
        view.userInteractionEnabled = false
        let dist = CGPointMake(0, view.frame.height)
        let tt = NSTimeInterval(totalTime)//NSTimeInterval(totalTime/CGFloat(q))
        let anim = UIAnimation.moveBy(dist, duration: tt)
        let wait = UIAnimation.waitForDuration(0.06)
        var anims = [UIAnimation]()
        for img in squareParts{
            anims.append(UIAnimation.runBlock({ 
                img.runAnimation(anim)
            }))
            anims.append(wait)
        }
        for img in restParts{
            anims.append(UIAnimation.runBlock({ 
                img.runAnimation(anim)
            }))
            anims.append(wait)
        }
        anims.removeLast()
        anims.append(UIAnimation.waitForDuration(tt))//3/16
        anims.append(UIAnimation.fadeOutWithDuration(0.3))
        placeView.runAnimation(UIAnimation.sequence(anims)) {
            self.presentViewController(RuinVC(), animated: false, completion: nil)
        }
        fadeButtons()
    }
    
    func goToSquare(){
        view.userInteractionEnabled = false
        let dist = CGPointMake(0, -view.frame.height)
        let tt = NSTimeInterval(totalTime)//NSTimeInterval(totalTime/CGFloat(q))
        let anim = UIAnimation.moveBy(dist, duration: tt)
        let wait = UIAnimation.waitForDuration(0.06)
        var anims = [UIAnimation]()
        for img in ruinParts{
            anims.append(UIAnimation.runBlock({
                img.runAnimation(anim)
            }))
            anims.append(wait)
        }
        for img in restParts{
            anims.append(UIAnimation.runBlock({
                img.runAnimation(anim)
            }))
            anims.append(wait)
        }
        anims.removeLast()
        anims.append(UIAnimation.waitForDuration(tt))//3/16
        anims.append(UIAnimation.fadeOutWithDuration(0.3))
        placeView.runAnimation(UIAnimation.sequence(anims)) {
            self.presentViewController(SquareVC(), animated: false, completion: nil)
        }
        fadeButtons()
    }
    
    func back(){
        view.userInteractionEnabled = false
        placeView.runAnimation(UIAnimation.fadeOutWithDuration(0.3)) {
            let vc = (self.presentingViewController as! IntroVC)
            self.dismissViewControllerAnimated(false) {
                vc.rollBack()
            }
        }
    }
    
    func fadeButtons(){
        let anim = UIAnimation.fadeOutWithDuration(NSTimeInterval(totalTime))
        for v in buttons{
            v.runAnimation(anim)
        }
    }
    
}