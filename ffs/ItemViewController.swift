//
//  ItemViewController.swift
//  ffs
//
//  Created by Valerie Chen on 11/11/16.
//  Copyright © 2016 Valerie Chen. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ItemViewController: UIViewController {
    
    let themeColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpGraph()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        self.view.backgroundColor = self.themeColor
    }
    
    func setUpGraph() {
        let graphFrame = CGRect(x: 0, y: 50, width: super.view.frame.width, height: super.view.frame.height / 3)
        let graphView = ScrollableGraphView(frame: graphFrame)
        let prices: [Double] = [0, 5, 10]
        let labels = ["nah", "sux", "yo"]
        
        var maxPrice: Double = 0
        for price in prices {
            maxPrice = max(maxPrice, price)
        }
        graphView.rangeMax = maxPrice
        
        graphView.backgroundFillColor = self.themeColor
        
        graphView.lineStyle = ScrollableGraphViewLineStyle.smooth
        graphView.lineColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1.0)
        graphView.lineWidth = 1
        
        graphView.shouldFill = true
        graphView.fillType = ScrollableGraphViewFillType.gradient
        graphView.fillGradientType = ScrollableGraphViewGradientType.linear
        graphView.fillGradientStartColor = UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 1.0)
        graphView.fillGradientEndColor = UIColor(red: 0.27, green: 0.27, blue: 0.27, alpha: 1.0)
        
        graphView.dataPointSpacing = 80
        graphView.dataPointSize = 2
        graphView.dataPointFillColor = UIColor.white
        
        graphView.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8.0)
        graphView.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        graphView.referenceLineLabelColor = UIColor.white
        graphView.dataPointLabelColor = UIColor.white.withAlphaComponent(0.5)
        
        graphView.topMargin = 10
        graphView.bottomMargin = 10
        
        graphView.direction = ScrollableGraphViewDirection.rightToLeft
        
        graphView.set(data: prices, withLabels: labels)
        self.view.addSubview(graphView)
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
