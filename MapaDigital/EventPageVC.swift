//
//  EventsVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class EventPageVC : UIPageViewController, UIPageViewControllerDataSource{
    
    let imgs : [String]
    let texts : [String]
    
    private let backButton = UIButton()
    
    //67 981
    
    init(overlayImg: String, imgs : [String], texts: [String]){
        self.imgs = imgs
        self.texts = texts
        let img = UIImage(named: "event_back")!
        backButton.setImage(img, forState: .Normal)
        let s = GlobalData.getScale()
        backButton.frame.size = s*img.size
        let overlay = GlobalData.newScreenView()
        let img1 = UIImageView(imageNamed: overlayImg)
        img1.frame.size = overlay.frame.size
        overlay.addSubview(img1)
        backButton.frame.origin = CGPointMake(67*s+overlay.frame.minX, 981*s+overlay.frame.minY)
        overlay.userInteractionEnabled = false
        super.init(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        view.addSubview(overlay)
        view.addSubview(backButton)
        setViewControllers([controllerAtIndex(0)], direction: .Forward, animated: true, completion: nil)
        dataSource = self
        
        backButton.addTarget(self, action: #selector(EventPageVC.dismiss), forControlEvents: .TouchUpInside)
    }
    
    func dismiss(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = (viewController as! EventVC).index
        return index==imgs.count-1 ? nil : controllerAtIndex(index+1)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = (viewController as! EventVC).index
        return index==0 ? nil : controllerAtIndex(index-1)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return imgs.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    private func controllerAtIndex(index : Int) -> UIViewController{
        let vc = EventVC(index: index, imgName: imgs[index], textImgName: texts[index])
        return vc
    }
}