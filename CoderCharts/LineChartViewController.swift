//
//  LineChartViewController.swift
//  CoderCharts
//
//  Created by Husein Kareem on 8/14/15.
//  Copyright (c) 2015 Husein Kareem. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    var points: [String]!
    var clientVC = ClientViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        //chart data
        let estimatePoints = clientVC.getEstimateGraphPoints()
        points = ["7/20", "7/21", "7/22", "7/23", "7/24", "7/25", "7/26", "7/27", "7/27", "7/28", "7/29"]
        setChart(points)
    }

    func setChart(dataPoints: [String]) {
        
        //line chart Views
        lineChartView.noDataText = "You need to provide data for the chart."
        lineChartView.descriptionText = ""
        lineChartView.animate(xAxisDuration: 2.0)
        lineChartView.legend.enabled = false
        lineChartView.backgroundColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        lineChartView.gridBackgroundColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
//        lineChartView.gridBackgroundColor = UIColor(patternImage: UIImage(named: "dotgrid.png")!)
        lineChartView.xAxis.enabled = true
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.scaleXEnabled = false
        lineChartView.scaleYEnabled = false
        lineChartView.xAxis.labelTextColor = UIColor.whiteColor()
        //expected line
        let yValOne = [0.0, 100.0, 200.0, 300.0, 400.0, 500.0, 600.0, 700.0, 800.0, 900.0, 1000.0]
        var dataEntriesOne: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: yValOne[i], xIndex: i)
            dataEntriesOne.append(dataEntry)
        }
        
        let lineChartDataSetOne = LineChartDataSet(yVals: dataEntriesOne)
        let lineChartDataOne = LineChartData(xVals: dataPoints, dataSet: lineChartDataSetOne)
        
        lineChartDataSetOne.setColor(UIColor(red: 238/255.0, green: 248/255.0, blue: 250/255.0, alpha: 1.0))
        lineChartDataSetOne.circleColors = [UIColor.clearColor()]

        //actual line
        let yValTwo = [0.0, 127.0, 150.0, 300.0, 333.0, 567.0, 600.0, 700.0, 900.0, 1000.0, 1007.0]
        var dataEntriesTwo: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: yValTwo[i], xIndex: i)
            dataEntriesTwo.append(dataEntry)
        }
        
        let lineChartDataSetTwo = LineChartDataSet(yVals: dataEntriesTwo)
        let lineChartDataTwo = LineChartData(xVals: dataPoints, dataSet: lineChartDataSetTwo)
        
        lineChartDataSetTwo.setColor(UIColor(red: 251/255.0, green: 38/255.0, blue: 108/255.0, alpha: 1.0))
        lineChartDataSetTwo.circleColors = [UIColor.clearColor()]

        //hours line
        let yValThree = [0.0, 133.0, 144.0, 200.0, 333.0, 657.0, 700.0, 920.0, 980.0, 1010.0, 1017.0]
        
        var dataEntriesThree: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: yValThree[i], xIndex: i)
            dataEntriesThree.append(dataEntry)
        }
        
        let lineChartDataSetThree = LineChartDataSet(yVals: dataEntriesThree)
        let lineChartDataThree = LineChartData(xVals: dataPoints, dataSet: lineChartDataSetThree)
        
        lineChartDataSetThree.setColor(UIColor(red: 96/255.0, green: 213/255.0, blue: 240/255.0, alpha: 1.0))
        lineChartDataSetThree.circleColors = [UIColor.clearColor()]

        //setting data points
        let lines = [lineChartDataSetOne, lineChartDataSetTwo, lineChartDataSetThree]
        lineChartView.data = LineChartData(xVals: dataPoints, dataSets: lines)
        lineChartView.data?.setValueTextColor(UIColor.clearColor())
    }

}
