////
////  BarChartPresentation.swift
////  diabestie.chart
////
////  Created by Dhiky Aldwiansyah on 21/04/21.
////
//
//import Foundation
//import CoreGraphics.CGGeometry
//import UIKit
//
//class BasicBarChartPresenter {
//    
//    let barWidth: CGFloat = 10.0
//    
//    let bottomTitleText: [String] = ["00","06","12","16"]
//    var dataEntries: [BarDataEntry] = []
//    
//    func computeHorizontalLinesText(viewHeight: CGFloat, viewWidth: CGFloat) -> [CATextLayer] {
//        var result: [CATextLayer] = []
//        let horizontalLineInfos = [
//            (value: CGFloat(0.0), text: "0"),
//            (value: CGFloat(0.5), text: "150"),
//            (value: CGFloat(1.0), text: "300"),
//        ]
//        
//        return result
//    }
//    
//    func computeHorizontalLines(viewHeight: CGFloat, viewWidth: CGFloat) -> [HorizontalLine] {
//        var result: [HorizontalLine] = []
//    
//        let horizontalLineInfos = [
//            (value: CGFloat(0.0), text: "0"),
//            (value: CGFloat(0.5), text: "\(viewHeight/2)"),
//            (value: CGFloat(1.0), text: "\(viewHeight)"),
//        ]
//        
//        horizontalLineInfos.forEach { (value, text) in
//            
//            let yPos = viewHeight - (value * viewHeight)
//            let lineLength = viewWidth - 80
//            let lineSegment = LineSegment(
//                startPoint: CGPoint(x: 0, y: yPos),
//                endPoint: CGPoint(x: lineLength, y: yPos)
//            )
//            
//            let line = HorizontalLine(segment: lineSegment, width: 0.5, text: text)
//            result.append(line)
//        }
//        
//        return result
//    }
//    
//    func computeBarEntries(viewHeight: CGFloat, viewWidth: CGFloat) -> [BarChartEntry] {
//        var result: [BarChartEntry] = []
//        
//        dataEntries.forEach { (entry) in
//            let barHeight = (CGFloat(entry.height) / viewHeight) * viewHeight
//            let yPos = viewHeight - barHeight
//            let xPos = viewHeight / CGFloat(entry.time)
//            let origin = CGPoint(x: xPos, y: yPos)
//            let barEntry = BarChartEntry(origin: origin, barWidth: barWidth, barHeight: barHeight, data: entry)
//            
//            result.append(barEntry)
//        }
//
//        return result
//    }
//
//}
