//
//  SecondTab_ViewController.swift
//  AI
//
//  Created by Philips on 17/08/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import Charts

class SecondTab_ViewController: UIViewController {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var AnalyticsTable: UITableView!
    
    var months: [String]!
    var unitsSold: [Double]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.isHidden = true
        
        
        // Do any additional setup after loading the view.
         self.AnalyticsTable.register(UINib(nibName: "AnalyticsTableViewCell", bundle: nil), forCellReuseIdentifier: "bargraphcell")
        
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
       // setChart(dataPoints: months, values: unitsSold)
    }
    
    
    func setChart(dataPoints: [String], values: [Double])-> BarChartData {
        //barChartView.noDataText = "You need to provide data for the chart."
        
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]) )
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        chartDataSet.colors = ChartColorTemplates.colorful()
        let chartData = BarChartData(dataSet: chartDataSet)
        
        
        //barChartView.data = chartData
        return chartData
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension SecondTab_ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 265
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        }
    
    }


extension SecondTab_ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AnalyticsTable.dequeueReusableCell(withIdentifier: "bargraphcell", for: indexPath) as! AnalyticsTableViewCell
        
        //let cell = self.liveEventTableView.dequeueReusableCell(withIdentifier: "LiveDetailCell") as! LiveDetailsTableViewCell
//        let event: Event = eventData[indexPath.row] as! Event
//
//        cell.eventType.text = event.event
//        cell.eventDate.text = event.date
//        cell.eventTime.text = event.time
//        cell.eventCount.text = "\(event.eventCount ?? 0)"
//        cell.eventlogo.image = UIImage(named:event.event!)
        cell.graphView.data = setChart(dataPoints: months, values: unitsSold)
        cell.graphView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        let ll = ChartLimitLine(limit: 10.0, label: "Target")
        cell.graphView.rightAxis.addLimitLine(ll)

        return cell
    }
    
}
