//
//  ViewController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/5/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mainNC: MainNavigationController!
    
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var buttonViews: [UIView]!
    @IBOutlet var buttonTitles: [UILabel]!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet var lineImages: [UIImageView]!
    @IBOutlet var iconImages: [UIImageView]!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let titleString = ["Food", "Grocery", "Promotions", "Gifts", "Lottery", "History", "Contact Us", "Settings", "Login"]
    
    
    func startLoading() {
        loadingView.hidden = false
        activityIndicator.startAnimating()
        
    }
    
    func stopLoading() {
        loadingView.hidden = true
        activityIndicator.stopAnimating()
    }
    
    
    
    
    
    
    var menuScale: CGFloat = 1.3
    var menuOpacity: CGFloat = 0.2
    var scale: CGFloat!
    var maxX: CGFloat!
    let hideValue: CGFloat = 2 / 3
    var maxY: CGFloat!
    let animationTime: NSTimeInterval = 0.3
    let animationOptions: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseOut
    var opened: Bool = false
    
    var startPoint: CGPoint!
    let screenWidth = UIScreen.mainScreen().bounds.width
    
    var multiplier: CGFloat { get { return Settings.sharedInstance.isArabic == true ? -1 : 1 } }
    
    override func viewDidLayoutSubviews() {
        stopLoading()
        scale = (CGFloat(buttonViews.count - 1) * buttonViews[0].bounds.height) / UIScreen.mainScreen().bounds.height
        
        let containerWidth = UIScreen.mainScreen().bounds.width * scale
        let distanceToScreen = (UIScreen.mainScreen().bounds.width - containerWidth) / 2
        maxX = distanceToScreen + containerWidth * hideValue
        
        maxX! *= multiplier
        let centerOfTable: CGFloat = buttonViews[0].frame.origin.y + ((CGFloat(buttonViews.count - 1) * buttonViews[0].frame.height) / 2)
        maxY = centerOfTable - containerView.center.y
        
        self.menuView.transform = CGAffineTransform(a: self.menuScale, b: 0, c: 0, d: self.menuScale, tx: 0, ty: 0)
        self.menuView.alpha = self.menuOpacity
        
        for var i = 0; i < iconImages.count; i++ {
            iconImages[i].image = DrawMenuIcon.iconByIndex(i, size: iconImages[i].frame.height)
        }
        
        for button in buttons {
            button.addTarget(self, action: "menuButtonTouchDown:", forControlEvents: UIControlEvents.TouchDown)
            button.addTarget(self, action: "menuButtonTouchDragOutside:", forControlEvents: UIControlEvents.TouchCancel)
            button.addTarget(self, action: "menuButtonTouchDragOutside:", forControlEvents: UIControlEvents.TouchDragOutside)
            button.addTarget(self, action: "menuButtonTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        CustomLabels.increaseLabelBySize(nameLabel, size: 3)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        startLoading()
        var i = 0
        for label in buttonTitles {
            CustomLabels.setWhiteLabel(label)
            label.text = LocalStrings.sharedInstance.localizedString(titleString[i])
            i++
        }
        
        for buttonView in buttonViews {
            buttonView.backgroundColor = FoodClubStyleKit.clear
        }
        
        for lineImage in lineImages {
            lineImage.image = FoodClubStyleKit.imageOfGradientLine(frame: lineImage.bounds)
        }
        
        
        
        logoImage.image = FoodClubStyleKit.imageOfLogoEmpty(frame: logoImage.bounds)
        
//        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "main" {
            mainNC = segue.destinationViewController as MainNavigationController
            mainNC.mainVC = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func openMenu(time: NSTimeInterval) {
        opened = true
        UIView.animateWithDuration(time,
            delay: 0.0,
            options: animationOptions,
            animations: {
                self.containerView.transform = CGAffineTransform(a: self.scale, b: 0, c: 0, d: self.scale, tx: self.maxX, ty: self.maxY)
                self.menuView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                self.menuView.alpha = 1
            },
            completion: { finished in
            self.menuView.alpha = 1
        })
    }
    
    func closeMenu(time: NSTimeInterval) {
        opened = false
        UIView.animateWithDuration(time,
            delay: 0.0,
            options: animationOptions,
            animations: {
                self.containerView.transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
                self.menuView.transform = CGAffineTransform(a: self.menuScale, b: 0, c: 0, d: self.menuScale, tx: 0, ty: 0)
                self.menuView.alpha = self.menuOpacity
            },
            completion: { finished in
            self.menuView.alpha = self.menuOpacity
        })


    }
    
    func collapse() {
        if opened == true {closeMenu(animationTime)}
        else {openMenu(animationTime)}
        
    }
    
    func calculate(ds: CGFloat)->(scale: CGFloat, tx: CGFloat, ty: CGFloat, mScale: CGFloat, mOpacity: CGFloat) {
        var distance: CGFloat = ds
        if abs(ds) > 2 {
            distance = ds < 0 ? -2 : 2
        }
        distance *= multiplier
        if opened == false {
            if distance < 0 {distance = 0}
            let tx: CGFloat = maxX * distance
            let ty: CGFloat = maxY * distance
            let scale = equasion(0, x2: 1, y1: 1, y2: self.scale, x: distance)
            let mScale = equasion(0, x2: 1, y1: self.menuScale, y2: 1, x: distance)
            let mOpacity = equasion(0, x2: 1, y1: self.menuOpacity, y2: 1, x: distance)
            return (scale, tx, ty, mScale, mOpacity)
        }
        else {
            let tx = equasion(0, x2: 1, y1: maxX, y2: 0, x: -distance)
            let ty = equasion(0, x2: 1, y1: maxY, y2: 0, x: -distance)
            let scale = equasion(0, x2: 1, y1: self.scale, y2: 1, x: -distance)
            let mScale = equasion(0, x2: 1, y1: 1, y2: self.menuScale, x: -distance)
            let mOpacity = equasion(0, x2: 1, y1: 1, y2: self.menuOpacity, x: -distance)
            return (scale, tx, ty, mScale, mOpacity)
        }
    }
    
    func equasion(x1: CGFloat, x2: CGFloat, y1: CGFloat, y2: CGFloat, x: CGFloat) -> CGFloat {
        let a = y1 - y2
        let b = x2 - x1
        let c = x1 * y2 - x2 * y1
        let res = -(a * x) - c
        return res
    }
    
    @IBAction func panGestureHendler(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Began:
            startPoint = sender.translationInView(self.view)
        case .Changed:
            let pos = sender.translationInView(self.view)
            var distance = pos.x / screenWidth * 1.2
            
            let newPos = calculate(distance)
            let newTrasform = CGAffineTransform(a: newPos.scale, b: 0, c: 0, d: newPos.scale, tx: newPos.tx, ty: newPos.ty)
            containerView.transform = newTrasform
            
            menuView.alpha = newPos.mOpacity
            menuView.transform = CGAffineTransformMakeScale(newPos.mScale, newPos.mScale)
            
            
        case .Ended:
            let pos = sender.translationInView(self.view)
            
            if Settings.sharedInstance.isArabic == true {
                if self.containerView.transform.tx < maxX / 2 { openMenu(animationTime / 2) }
                else { closeMenu(animationTime / 2) }
            }
            else {
                if self.containerView.transform.tx > maxX / 2 { openMenu(animationTime / 2) }
                else { closeMenu(animationTime / 2) }
            }
        default:
            println("not set")
        }
    }
    
    
    
    
    @IBAction func menuButtonTouchDown(sender: UIButton) {
        buttonViews[sender.tag].backgroundColor = FoodClubStyleKit.whiteTransparent
    }

    @IBAction func menuButtonTouchDragOutside(sender: UIButton) {
        buttonViews[sender.tag].backgroundColor = FoodClubStyleKit.clear
    }
    
    @IBAction func menuButtonTouchUpInside(sender: UIButton) {
        if sender.tag == 8 {
            if let isLogined = Settings.sharedInstance.isLogined {
                if isLogined {
                    println("go to account \(0)")
                }
                else {
                    println("go to login \(0)")
                }
            }
            else {
                Settings.sharedInstance.isLogined = false
            }
        }
        else {
            buttonViews[sender.tag].backgroundColor = FoodClubStyleKit.clear
            println("sender tag \(sender.tag)")
            mainNC.changePage(sender.tag)
        }
    }
    
    
}

