//
//  FCTitleLabel.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/6/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

// this class is a template for all labels in application

public class CustomLabels : NSObject {
    
    //// Cache
    
    private struct Cache {
        static var whiteLabelFont = UIFont(name: "HelveticaNeue-Light", size: 17)
        static var whiteLableTextColor = FoodClubStyleKit.white
        
        static var blackLabelFont = UIFont(name: "HelveticaNeue-Light", size: 17)
        static var blackLableTextColor = FoodClubStyleKit.black
        
        static var topBarLabelFont = UIFont(name: "HelveticaNeue-Light", size: 17)
        static var topBarLableTextColor = FoodClubStyleKit.white
        
        static var whiteBoldLabelFont = UIFont(name: "HelveticaNeue", size: 17)
        static var whiteBoldLableTextColor = FoodClubStyleKit.white
        
        static var blackBoldLabelFont = UIFont(name: "HelveticaNeue", size: 17)
        static var blackBoldLableTextColor = FoodClubStyleKit.black
        
        static var contentLabelFont = UIFont(name: "HelveticaNeue-Light", size: 12)
        static var contentLableTextColor = FoodClubStyleKit.black
        
        static var contentItalicLabelFont = UIFont(name: "HelveticaNeue-LightItalic", size: 12)
        static var contentItalicLableTextColor = FoodClubStyleKit.gray
        


    }
    
    //// Titles
    
    public class func setBlackBoldLabel(label : UILabel) {
        label.font = Cache.blackBoldLabelFont
        label.textColor = Cache.blackBoldLableTextColor
    }
    
    public class func blackBoldLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.blackBoldLabelFont
        label.textColor = Cache.blackBoldLableTextColor
        return label
    }
    
    
    public class func setWhiteBoldLabel(label : UILabel) {
        label.font = Cache.whiteBoldLabelFont
        label.textColor = Cache.whiteBoldLableTextColor
    }
    
    public class func whiteBoldLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.whiteBoldLabelFont
        label.textColor = Cache.whiteBoldLableTextColor
        return label
    }
    
    public class func setContentItalicLabel(label : UILabel) {
        label.font = Cache.contentItalicLabelFont
        label.textColor = Cache.contentItalicLableTextColor
    }
    
    public class func contentItalicLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.contentItalicLabelFont
        label.textColor = Cache.contentItalicLableTextColor
        return label
    }
    
    public class func setContentLabel(label : UILabel) {
        label.font = Cache.contentLabelFont
        label.textColor = Cache.contentLableTextColor
    }
    
    public class func contentLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.contentLabelFont
        label.textColor = Cache.contentLableTextColor
        return label
    }
    
    public class func setTopBarLabel(label : UILabel) {
        label.font = Cache.topBarLabelFont
        label.textColor = Cache.topBarLableTextColor
    }
    
    public class func topBarLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.topBarLabelFont
        label.textColor = Cache.topBarLableTextColor
        return label
    }
    
    public class func setWhiteLabel(label : UILabel) {
        label.font = Cache.whiteLabelFont
        label.textColor = Cache.whiteLableTextColor
    }
    
    public class func titleWhiteLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.whiteLabelFont
        label.textColor = Cache.whiteLableTextColor
        return label
    }
    
    public class func setBlackLabel(label : UILabel) {
        label.font = Cache.blackLabelFont
        label.textColor = Cache.blackLableTextColor
    }
    
    public class func titleBlackLabel() -> UILabel {
        let label = UILabel()
        label.font = Cache.blackLabelFont
        label.textColor = Cache.blackLableTextColor
        return label
    }
    
    public class func increaseLabelBySize(label: UILabel, size: CGFloat) {
        let fontSize = label.font.pointSize
        let fontName = label.font.fontName
        label.font = UIFont(name: fontName, size: fontSize + size)
    }
    
    
    
    
    
}
