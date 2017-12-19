//
//  LiveDetailsTableViewCell.swift
//  AIfinity
//
//  Created by Mushtaque Ahmed on 11/28/17.
//  Copyright © 2017 Mushtaque Ahmed. All rights reserved.
//

import UIKit

class LiveDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventlogo: UIImageView!
    
    @IBOutlet weak var eventType: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventCount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
