//
//  EventVC.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class EventVC : RatioUIVC{
    
    let index : Int
    
    /*
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        placeView.addSubview(img)
        img.frame.size = placeView.frame.size
    }*/
    
    
    init(index: Int, imgName: String, textImgName: String){
        let img2 = UIImageView(imageNamed: "retangulo-fixo")
        self.index = index
        let img = UIImageView(imageNamed: imgName)
        let txt = UIImageView(imageNamed: textImgName)
        txt.layer.zPosition = 10
        super.init(nibName: nil, bundle: nil)
        img2.frame.size = placeView.frame.size
        placeView.addSubview(img)
        placeView.addSubview(img2)
        placeView.addSubview(txt)
        img.frame.size = placeView.frame.size
        txt.frame.size = placeView.frame.size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}