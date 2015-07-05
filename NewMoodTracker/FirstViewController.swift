//
//  FirstViewController.swift
//  NewMoodTracker
//
//  Created by Jocelyn Liu on 7/2/15.
//  Copyright (c) 2015 Jocelyn Liu. All rights reserved.
//

import UIKit
import Charts

class FirstViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var barChartView: BarChartView!
    
    var months: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(months, values: unitsSold)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
        
        barChartView.xAxis.labelPosition = .Bottom
        
        chartDataSet.colors = ChartColorTemplates.vordiplom()
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }

}

