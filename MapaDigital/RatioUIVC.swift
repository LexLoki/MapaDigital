//
//  RatioUIVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class RatioUIVC : UIViewController{
    
    internal let placeView = UIView()
    private let backPlaceView = UIView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        placeView.backgroundColor = UIColor.whiteColor()
        backPlaceView.backgroundColor = UIColor.whiteColor()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        view.addSubview(backPlaceView)
        view.addSubview(placeView)
        view.backgroundColor = UIColor.blackColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeView.frame = GlobalData.getFrame()
        backPlaceView.frame = placeView.frame
    }
    
}