//
//  DrawButtonIcon.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/9/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit
class DrawButtonIcon {
    
    class func menuIcon(size: CGFloat = 30, strokeWidth: CGFloat = 3) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return FoodClubStyleKit.imageOfMenuButton(frame: rect, strokeWidth: strokeWidth)
    }
    
    class func filterIcon(size: CGFloat = 30, strokeWidth: CGFloat = 1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return FoodClubStyleKit.imageOfFilterButton(frame: rect, strokeWidth: strokeWidth)
        
    }
    
    class func cancelIcon(size: CGFloat = 20, strokeWidth: CGFloat = 1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return FoodClubStyleKit.imageOfCancelButton(frame: rect, strokeWidth: strokeWidth)
        
    }
    
    class func backIcon(size: CGFloat = 30, strokeWidth: CGFloat = 1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return FoodClubStyleKit.imageOfBackButton(frame: rect, strokeWidth: strokeWidth)
        
    }
    
    class func likeIcon(size: CGFloat = 30, strokeWidth: CGFloat = 1) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size, height: size)
        return FoodClubStyleKit.imageOfLikeButton(frame: rect, strokeWidth: 2, isWhite: false)
        
    }
    
    
}
