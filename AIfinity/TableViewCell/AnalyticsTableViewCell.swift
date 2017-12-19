//
//  AnalyticsTableViewCell.swift
//  AIfinity
//
//  Created by Mushtaque Ahmed on 11/28/17.
//  Copyright © 2017 Mushtaque Ahmed. All rights reserved.
//

import UIKit
import Charts

enum ChartType {
    case barchart
    case linechart
    case scatterplot
    case piechart
}

class AnalyticsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var graphView: BarChartView!
    var graphType = ChartType.barchart //defaultType
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
