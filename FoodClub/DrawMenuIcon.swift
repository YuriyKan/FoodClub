//
//  DrawMenuIcon.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/10/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class DrawMenuIcon {
    class func hatIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconHat(frame: rect)
    }
    
    class func dishIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconDish(frame: rect)
    }
    
    class func starIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconStar(frame: rect)
    }
    
    class func appleIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconApple(frame: rect)
    }
    
    class func settingsIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconSettings(frame: rect)
    }
    
    class func giftIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconGift(frame: rect)
    }
    
    class func callIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconCall(frame: rect)
    }
    
    class func grillIcon(size: CGFloat) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return MainMenuIcons.imageOfIconGrill(frame: rect)
    }
    
    class func iconByIndex(index: Int, size: CGFloat) -> UIImage {
        switch index {
        case 0:
            return dishIcon(size)
        case 1:
            return appleIcon(size)
        case 2:
            return starIcon(size)
        case 3:
            return giftIcon(size)
        case 4:
            return hatIcon(size)
        case 5:
            return grillIcon(size)
        case 6:
            return callIcon(size)
        case 7:
            return settingsIcon(size)
        default:
            return UIImage()
        }
    }
}