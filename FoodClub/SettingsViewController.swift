//
//  SettingsViewController.swift
//  FoodClub
//
//  Created by Yuriy Kan on 3/9/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class SettingsViewController: TemplateViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    let headerHeight: CGFloat = 10
    let cellHeight: CGFloat = 50
    
    var data = [["Language"], ["Location", "Get Promotion", "Load Images"], ["Address", "Add New Address"], ["Change Password"]]
    var addresses: [String] = ["Address 1", "Uzbekistan, Tashkent, Risoviy","Address 1", "Uzbekistan, Tashkent, Risoviy"]
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    func updateTableViewHeight() {
        var newHeight = CGFloat(data.count) * headerHeight
        newHeight += cellHeight * CGFloat(6 + addresses.count)
        tableViewHeight.constant = newHeight
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateTableViewHeight()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLeftButtonStyle(.Menu)
        topBarLabel.text = LocalStrings.sharedInstance.localizedString("Settings")
        titleLabel.text = LocalStrings.sharedInstance.localizedString("Settings")

        CustomLabels.setWhiteLabel(titleLabel)
        CustomLabels.increaseLabelBySize(titleLabel, size: 2)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: headerHeight))
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {return addresses.count + 1}
        else {return data[section].count}
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as TableViewCell
        if indexPath.section == 2 {
            if addresses.count == 0 {cell.setBackgroundImage(.Single)}
            else {
                if indexPath.row == 0 {cell.setBackgroundImage(.Top)}
                else if indexPath.row == addresses.count {cell.setBackgroundImage(.Bottom)}
                else {cell.setBackgroundImage(.Middle)}
            }
        }
        else {
            if data[indexPath.section].count == 1 {cell.setBackgroundImage(.Single)}
            else {
                if indexPath.row == 0 {cell.setBackgroundImage(.Top)}
                else if indexPath.row == data[indexPath.section].count - 1 {cell.setBackgroundImage(.Bottom)}
                else {cell.setBackgroundImage(.Middle)}
            }
        }
        
        
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = LocalStrings.sharedInstance.localizedString(data[indexPath.section][indexPath.row])
            cell.detailLabel.text = Settings.sharedInstance.isArabic ? "Arabic" : "English"
            cell.setStyle(TableViewCell.CellStyle.BlackGrayArrow)
        case 1:
            cell.titleLabel.text = LocalStrings.sharedInstance.localizedString(data[indexPath.section][indexPath.row])
            cell.switcher.addTarget(self, action: "switchValueChanged:", forControlEvents: .ValueChanged)
            cell.switcher.tag = indexPath.row
            cell.setStyle(TableViewCell.CellStyle.BlackSwitch)
            switch indexPath.row {
            case 0:
                cell.switcher.setOn(Settings.sharedInstance.enableLocation, animated: false)
            case 1:
                cell.switcher.setOn(Settings.sharedInstance.enablePromotion, animated: false)
            case 2:
                cell.switcher.setOn(Settings.sharedInstance.enableImageLoading, animated: false)
            default:
                println("not set")
            }
        case 2:
            if indexPath.row == addresses.count {
                cell.titleLabel.text = LocalStrings.sharedInstance.localizedString(data[2][1])
                cell.setStyle(.Green)
            }
            else {
                cell.titleLabel.text = LocalStrings.sharedInstance.localizedString(data[2][0])
                cell.detailLabel.text = addresses[indexPath.row]
                cell.setStyle(.BlackBlackArrow)
            }
        case 3:
            cell.titleLabel.text = LocalStrings.sharedInstance.localizedString(data[indexPath.section][indexPath.row])
            cell.setStyle(.BlackArrow)
        default :
            println("not set")
        }
        
        
        
        
        
        
        
        return cell
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("TableView did select row at index path \(indexPath.row)")
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftButtonPressed(sender: UIButton) {
        (navigationController as MainNavigationController).mainVC.collapse()
    }
    
    func switchValueChanged(sender: UISwitch) {
        switch sender.tag {
        case 0:
            Settings.sharedInstance.enableLocation = sender.on
        case 1:
            Settings.sharedInstance.enablePromotion = sender.on
        case 2:
            Settings.sharedInstance.enableImageLoading = sender.on
        default:
            println("not set")
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
