//
//  AllFiltersViewController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/12/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class AllFiltersViewController: UIViewController {
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var topBarLabel: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    
    func setupView() {
        if let button = rightButton {
            button.setImage(DrawButtonIcon.cancelIcon(), forState: .Normal)
        }
        if let image = leftImage {
            image.image = DrawButtonIcon.likeIcon()
        }
        if let label = topBarLabel {
            CustomLabels.setTopBarLabel(label)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeFilter(sender: UIButton) {
        UIApplication.sharedApplication().sendAction("closeSearchFilter:", to: nil, from: self, forEvent: nil)
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
