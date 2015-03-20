//
//  TemplateViewController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/10/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController, UIScrollViewDelegate {
    enum ButtonStyle {
        case Menu, Back, Filter, Cancel, Like
    }
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var topBarLabel: UILabel!
    
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var otherViews: [UIView]!
    @IBOutlet var centerViews: [UIView]!
    var otherViewsStartFrames: [CGRect] = []
    var centerViewsStartFrames: [CGRect] = []
    var imageFrame: CGRect!

    override func viewDidLayoutSubviews() {
        if let image = mainImage {
            imageFrame = image.frame
            image.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            image.frame.origin.y = imageFrame.origin.y
        }
        if let topLabel = topBarLabel {
            CustomLabels.setTopBarLabel(topLabel)
        }
        
        if let arr = otherViews {
            for item in otherViews {
                let frame = item.frame
                otherViewsStartFrames.append(frame)
            }
        }
        
        if let arr = centerViews {
            for item in centerViews {
                let frame = item.frame
                centerViewsStartFrames.append(frame)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setButtonStyle(button: UIButton, buttonStyle: ButtonStyle) {
        var image: UIImage!
        switch buttonStyle {
        case .Menu:
            image = DrawButtonIcon.menuIcon()
        case .Back:
            image = DrawButtonIcon.backIcon()
        case .Filter:
            image = DrawButtonIcon.filterIcon()
        case .Cancel:
            image = DrawButtonIcon.cancelIcon()
        case .Like:
            image = DrawButtonIcon.likeIcon()
        }
        button.setImage(image, forState: .Normal)
    }
    
    func setLeftButtonStyle(buttonStyle: ButtonStyle) {
        if let button = leftButton {
            setButtonStyle(button, buttonStyle: buttonStyle)
        }
    }
    
    func setRightButtonStyle(buttonStyle: ButtonStyle) {
        if let button = rightButton {
            setButtonStyle(button, buttonStyle: buttonStyle)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if let _scr = self.scrollView {
            if scrollView == self.scrollView {
                if scrollView.contentOffset.y < 0 {
                    if let image = mainImage {
//                        mainImage.frame.origin.y = imageFrame.origin.y - imageFrame.height / 2
                        let offset = abs(scrollView.contentOffset.y)
                        let newHeight = imageFrame.height + offset
                        let newScale = newHeight / imageFrame.height
                        
                        mainImage.transform = CGAffineTransformMake(newScale, 0, 0, newScale, 0, 0)
                        mainImage.frame.origin.y = imageFrame.origin.y
                        if let someViews = centerViews {
                            for var i = 0; i < centerViews.count; i++ {
                                let item = centerViews[i]
                                let frame = centerViewsStartFrames[i]
                                let imageCenter = (imageFrame.origin.y + imageFrame.height / 2)
                                let newImageCenter = (imageFrame.origin.y + imageFrame.height * newScale / 2)
                                let distanceFromCenter = ((frame.origin.y + frame.height / 2)) - imageCenter
                                let newCenter = distanceFromCenter + newImageCenter
                                item.center.y = newCenter
                            }
                        }
                        if let someViews = otherViews {
                            for var i = 0; i < otherViews.count; i++ {
                                let item = otherViews[i]
                                let frame = otherViewsStartFrames[i]
                                item.frame.origin.y = frame.origin.y * newScale
                            }
                        }
                    }
                }
                else {
                    if let image = mainImage {
                        mainImage.transform = CGAffineTransformMakeScale(1, 1)
                        mainImage.frame.origin.y = imageFrame.origin.y - scrollView.contentOffset.y
                        
                        if let someViews = otherViews {
                            for var i = 0; i < otherViews.count; i++ {
                                let item = otherViews[i]
                                let frame = otherViewsStartFrames[i]
                                item.frame.origin.y = frame.origin.y - scrollView.contentOffset.y
                            }
                        }
                        
                        if let someViews = centerViews {
                            for var i = 0; i < centerViews.count; i++ {
                                let item = centerViews[i]
                                let frame = centerViewsStartFrames[i]
                                item.frame.origin.y = frame.origin.y - scrollView.contentOffset.y
                            }
                        }
                    }
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
