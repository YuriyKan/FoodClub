//
//  Settings.swift
//  TestProject
//
//  Created by Yuriy Kan on 3/16/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import Foundation
import UIKit
var toSettings: Bool = false


class Settings {
    struct Address {
        var city: String
        var area: String
        var fullAddress: String
    }
    
    var allAddresses: [Address] {
        get {
            return [Address]()
        }
    }
    
    var isLogined: Bool!
    
    var isArabic: Bool {
        get {
            return (NSLocale.preferredLanguages()[0] as String) == "ar"
        }
    }
    
    var preferredLanguage: String {
        return (NSLocale.preferredLanguages()[0] as String)
    }
    
    var enableLocation: Bool {
        get {
            if let value = NSUserDefaults.standardUserDefaults().objectForKey("enableLocation") as? Bool {return value}
            else {return true}
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "enableLocation")
        }
    }
    
    var enablePromotion: Bool {
        get {
            if let value = NSUserDefaults.standardUserDefaults().objectForKey("enablePromotion") as? Bool {return value}
            else {return true}
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "enablePromotion")
        }
    }
    
    var enableImageLoading: Bool {
        get {
            if let value = NSUserDefaults.standardUserDefaults().objectForKey("enableImageLoading") as? Bool {return value}
            else {return true}
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "enableImageLoading")
        }
    }
    
    var password: String {
        get {
            if let value = NSUserDefaults.standardUserDefaults().objectForKey("password") as? String {return value}
            else {return ""}
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "password")
        }
    }
    
    func storyboard() -> UIStoryboard {
        if Settings.sharedInstance.isArabic {
            return UIStoryboard(name: "Arabic", bundle: NSBundle.mainBundle())
        }
        else {
            return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        }
    }
    func setLanguage(lang: String) {
        NSUserDefaults.standardUserDefaults().setObject([lang], forKey: "AppleLanguages")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func currentLanguage() -> String {
        if Settings.sharedInstance.isArabic {return "ar"}
        else {return "en"}
    }
    
    class var sharedInstance: Settings {
        struct Static {
            static var instance: Settings?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Settings()
        }
        
        return Static.instance!
    }
}