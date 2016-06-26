//
//  GlobalData.swift
//  MapaDigital
//
//  Created by Pietro Ribeiro Pepe on 6/25/16.
//  Copyright © 2016 Pietro Ribeiro Pepe. All rights reserved.
//

import UIKit

class GlobalData{
    
    //private static var instance : GlobalData!
    private static let screenRatio = CGSizeMake(1920.0,1080.0)
    private static let screenSize = UIScreen.mainScreen().bounds.size
    private static let appScreenSize = screenRatio.bestFitSize(forSize: GlobalData.screenSize)
    //private static let appRatio =
    
    static func getSize()->CGSize{
        return appScreenSize
    }
    
    static func getFrame()->CGRect{
        let s = getSize()
        return CGRectMake((screenSize.width-s.width)/2, (screenSize.height-s.height)/2, s.width, s.height)
    }
    
    static func newScreenView()->UIView{
        return UIView(frame: getFrame())
    }
    
    static func getScale()->CGFloat{
        return appScreenSize.width/screenRatio.width//min(screenSize.width/appScreenSize.width, screenSize.height/appScreenSize.height)
    }
    
}

func *(left: CGFloat, right: CGSize) -> CGSize{
    return CGSizeMake(left*right.width, left*right.height)
}

extension CGSize{
    func bestFitSize(forSize size: CGSize) -> CGSize{
        let sc = min(size.width/width, size.height/height)
        return CGSizeMake(sc*width, sc*height)
    }
}

extension UIImageView{
    convenience init(imageNamed: String){
        self.init()
        image = UIImage(named: imageNamed)
    }
}