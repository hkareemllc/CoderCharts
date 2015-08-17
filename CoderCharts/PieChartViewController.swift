//
//  PieChartViewController.swift
//  CoderCharts
//
//  Created by Husein Kareem on 8/17/15.
//  Copyright (c) 2015 Husein Kareem. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    var months: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        months = ["Hello", "Hi"]
        let unitsSold = [75.0, 25.0]
        setChart(months, values: unitsSold)
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        pieChartView.noDataText = "You need to provide data for the chart."
        pieChartView.centerText = "20%"
        pieChartView.centerTextColor = UIColor.whiteColor()
        pieChartView.descriptionText = ""
        pieChartView.animate(xAxisDuration: 1.5)
        pieChartView.legend.enabled = false
        pieChartView.userInteractionEnabled = false
        pieChartView.backgroundColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        pieChartView.holeColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        pieChartView.data?.setValueTextColor(UIColor.clearColor())
        
        var colors = [UIColor.blackColor(), UIColor(red: 251/255.0, green: 38/255.0, blue: 108/255.0, alpha: 1.0)]
        pieChartDataSet.colors = colors
    }

}
