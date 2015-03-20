//
//  TableViewCell.swift
//  tableview
//
//  Created by Yuriy Kan on 3/16/15.
//  Copyright (c) 2015 Yuriy Kan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    enum CellStyle {
        case BlackGrayArrow, BlackSwitch, BlackBlackArrow, Green, BlackArrow
    }
    enum BackgroundImageStyle {
        case Single, Top, Bottom, Middle
    }
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var arrowImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowImage.image = FoodClubStyleKit.imageOfArrowRight(frame: arrowImage.bounds, strokeWidth: 1)
        CustomLabels.setBlackLabel(titleLabel)
        CustomLabels.setBlackLabel(detailLabel)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setBackgroundImage(imageStyle: BackgroundImageStyle) {
        switch imageStyle {
        case .Single: bgImage.image = FoodClubStyleKit.imageOfSingleCellImage(frame: bgImage.bounds)
        case .Top: bgImage.image = FoodClubStyleKit.imageOfTopCellImage(frame: bgImage.bounds)
        case .Bottom: bgImage.image = FoodClubStyleKit.imageOfBottomCellImage(frame: bgImage.bounds)
        case .Middle: bgImage.image = FoodClubStyleKit.imageOfMiddleCellImage(frame: bgImage.bounds)
        }
    }
    
    func setStyle(cellStyle:CellStyle) {
        switch cellStyle {
        case .BlackGrayArrow:
            titleLabel.hidden = false
            detailLabel.hidden = false
            switcher.hidden = true
            arrowImage.hidden = false
            
            titleLabel.textColor = UIColor.blackColor()
            detailLabel.textColor = FoodClubStyleKit.border
            
//            accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        case .BlackSwitch:
            titleLabel.hidden = false
            detailLabel.hidden = true
            switcher.hidden = false
            arrowImage.hidden = true
            
            titleLabel.textColor = UIColor.blackColor()
            detailLabel.textColor = UIColor.grayColor()
            
//            accessoryType = UITableViewCellAccessoryType.None
        case .BlackBlackArrow:
            titleLabel.hidden = false
            detailLabel.hidden = false
            switcher.hidden = true
            arrowImage.hidden = false
            
            titleLabel.textColor = UIColor.blackColor()
            detailLabel.textColor = UIColor.blackColor()
            
//            accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        case .Green:
            titleLabel.hidden = false
            detailLabel.hidden = true
            switcher.hidden = true
            arrowImage.hidden = true
            titleLabel.textColor = FoodClubStyleKit.green
            detailLabel.textColor = UIColor.greenColor()
            
//            accessoryType = UITableViewCellAccessoryType.None
        case .BlackArrow:
            titleLabel.hidden = false
            detailLabel.hidden = true
            switcher.hidden = true
            arrowImage.hidden = false
            titleLabel.textColor = UIColor.blackColor()
            detailLabel.textColor = UIColor.greenColor()
            
//            accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
    }

}
