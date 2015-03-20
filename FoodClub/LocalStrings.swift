//
//  LocalStrings.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/17/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import Foundation

class LocalStrings {
    var dictionary: NSDictionary? {
        get {
            let path = NSBundle.mainBundle().pathForResource(Settings.sharedInstance.currentLanguage(), ofType: "plist")
            if let _path = path {
                if let dict = NSDictionary(contentsOfFile: _path) {
                    return dict
                }
            }
            return nil
        }
    }
    
    func localizedString(st: String) -> String {
        if let result = LocalStrings.sharedInstance.dictionary?.objectForKey(st) as? String {
            return result
        }
        else {
            return "Not Found"
        }
    }
    
    class var sharedInstance: LocalStrings {
        struct Static {
            static var instance: LocalStrings?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = LocalStrings()
        }
        
        return Static.instance!
    }

}