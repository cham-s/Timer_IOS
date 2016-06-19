//
//  TimeCell.swift
//  Timer
//
//  Created by Chamsidine ATTOUMANI on 6/19/16.
//  Copyright © 2016 Chamsidine ATTOUMANI. All rights reserved.
//

import UIKit

class TimeCell: UITableViewCell {
    
    

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
