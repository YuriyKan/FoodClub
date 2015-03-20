//
//  MainPageViewController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/6/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class MainPageViewController: TemplateViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!

    @IBOutlet weak var filterButton: UIButton!
    
    var titles = ["All Restaurants", "Pizza", "Burgers", "Sushi"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as ImageTableViewCell
        cell.bgImage.image = UIImage(named: "image\(indexPath.row + 1)")
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("TableView did select row at index path \(indexPath.row)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        (navigationController as MainNavigationController).mainVC.startLoading()
        setLeftButtonStyle(.Menu)
    }

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonPressed(sender: UIButton) {
        (navigationController as MainNavigationController).mainVC.collapse()
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
