//
//  MainNavigationController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/6/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    var mainVC: ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
//        mainVC.stopLoading()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changePage(pageIndex: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch pageIndex {
        case 0:
            println("go to Food \(0)")
            let vc = storyboard.instantiateViewControllerWithIdentifier("MainPageViewController") as MainPageViewController
            self.viewControllers = [vc]
        case 1:
            println("go to Grocery \(1)")
        case 2:
            println("go to Promotion \(2)")
        case 3:
            println("go to Gifts \(3)")
        case 4:
            println("go to Lottery \(4)")
        case 5:
            println("go to History \(5)")
        case 6:
            println("go to Contact Us \(6)")
        case 7:
            println("go to Settings \(6)")
            let vc = storyboard.instantiateViewControllerWithIdentifier("SettingsViewController") as SettingsViewController
            self.viewControllers = [vc]
        case 7:
            println("go to Login \(7)")
        default:
            println("not set")
        }
        
        if mainVC.opened == true {
            mainVC.closeMenu(mainVC.animationTime)
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
