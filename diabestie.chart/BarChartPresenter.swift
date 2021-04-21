//
//  BarChartPresentation.swift
//  diabestie.chart
//
//  Created by Dhiky Aldwiansyah on 21/04/21.
//

import Foundation
import CoreGraphics.CGGeometry
import UIKit

class BasicBarChartPresenter {
    
    let barWidth: CGFloat = 10.0
    let bottomSpace: CGFloat = 40.0
    
    let bottomTitleText: [String] = ["00","06","12","16"]
    var dataEntries: [BarDataEntry] = []
    var highestValue = 300

    func computeBarEntries(viewHeight: CGFloat, viewWidth: CGFloat) -> [BarChartEntry] {
        var result: [BarChartEntry] = []
        
        for (_, entry) in dataEntries.enumerated() {
            let entryHeight = CGFloat(Float(entry.height) / Float(highestValue)) * (viewHeight - bottomSpace)
            let yPosition = viewHeight - bottomSpace - entryHeight
            
            //Known issues
            //Will not accurate in landscape mode / different size, need a further checkup!
            let xPos = (CGFloat(viewWidth * CGFloat(entry.time)) / 30)
            let origin = CGPoint(x: xPos, y: yPosition)
            let barEntry = BarChartEntry(origin: origin, barWidth: barWidth, barHeight: entryHeight, data: entry)
            
            result.append(barEntry)
        }
        return result
    }
    
    func computeHorizontalLines(viewHeight: CGFloat, viewWidth: CGFloat) -> [HorizontalLine] {
        var result: [HorizontalLine] = []
        
        let horizontalLineInfos = [
            (value: CGFloat(0.0), isDashed: false, text: "0"),
            (value: CGFloat(0.5), isDashed: false, text: "\(highestValue/2)"),
            (value: CGFloat(1.0), isDashed: false, text: "\(highestValue)")
        ]
        
        for lineInfo in horizontalLineInfos {
            let yPosition = viewHeight - bottomSpace -  lineInfo.value * (viewHeight - bottomSpace)
            
            let length = viewWidth - 80
            let lineSegment = LineSegment(
                startPoint: CGPoint(x: 0, y: yPosition),
                endPoint: CGPoint(x: length , y: yPosition)
            )
            let line = HorizontalLine(
                segment: lineSegment,
                isDashed: lineInfo.isDashed,
                width: 0.5,
                value: lineInfo.value,
                text: lineInfo.text)
            result.append(line)
        }
        
        return result
    }
    
    func computeVerticalLines(viewHeight: CGFloat, viewWidth: CGFloat) -> [VerticalLine] {
        var result: [VerticalLine] = []
        
        let verticalDashLineInfos = [
            (false),
            (true),
            (true),
            (true),
            (false)
        ]
        
        for (index, lineInfo) in verticalDashLineInfos.enumerated() {
            let xPos = CGFloat(index) * (viewWidth/4 - 20)
            
            let lineSegment = LineSegment(
                startPoint: CGPoint(x: xPos, y: viewHeight),
                endPoint: CGPoint(x: xPos, y: 0)
            )
            let line = VerticalLine(
                segment: lineSegment,
                isDashed: lineInfo,
                width: 0.5)
            result.append(line)
        }
        
        return result
    }
}
