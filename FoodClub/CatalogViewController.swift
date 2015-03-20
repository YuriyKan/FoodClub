//
//  CatalogViewController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/12/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class CatalogViewController: TemplateViewController {
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var shadowView: UIView!
    var collapsed: Bool = false
    let animationTime: Double = 0.2
    override func viewDidLayoutSubviews() {
        self.filterView.transform = CGAffineTransformMakeTranslation(self.filterView.frame.width, 0)
    }
    
    @IBAction func shadowViewTapped(sender: AnyObject) {
        hideFilter()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setLeftButtonStyle(.Back)
        setRightButtonStyle(.Filter)
        shadowView.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFilter() {
        UIView.animateWithDuration(animationTime, animations: {
            self.filterView.transform = CGAffineTransformMakeTranslation(0, 0)
            self.shadowView.alpha = 1
            })
        collapsed = true
        shadowView.hidden = false
        self.shadowView.alpha = 1
    }

    func hideFilter() {
        UIView.animateWithDuration(animationTime, animations: {
            self.filterView.transform = CGAffineTransformMakeTranslation(self.filterView.frame.width, 0)
            self.shadowView.alpha = 0
        })
        collapsed = false
        shadowView.hidden = true
        self.shadowView.alpha = 0
    }
    
    func collapseFilter() {
        if collapsed == true {
            hideFilter()
        }
        else {
            showFilter()
        }
    }
    
    func closeSearchFilter(sender: AnyObject) {
        hideFilter()
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    
    }
    
    @IBAction func filterButtonPressed(sender: UIButton) {
        collapseFilter()
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
