////
////  BarChart.swift
////  diabestie.chart
////
////  Created by Dhiky Aldwiansyah on 21/04/21.
////
//
//import Foundation
//import UIKit
//
//class BarChart: UIView {
//    
//    private let mainLayer: CALayer = CALayer()
//    private let presenter = BasicBarChartPresenter()
//    
//    private var barEntries: [BarChartEntry] = [] {
//        didSet {
//            mainLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
//            showHorizontalLines()
//            showTextBesideHorizontalLine()
//            
//            barEntries.forEach { (entry) in
//                showBarChart(entry: entry)
//            }
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupView()
//    }
//    
//    func updateDataEntries(dataEntries: [BarDataEntry], animated: Bool) {
//        self.presenter.dataEntries = dataEntries
//        self.barEntries = self.presenter.computeBarEntries(viewHeight: self.frame.height, viewWidth: self.frame.width)
//    }
//    
//    private func setupView() {
//        self.layer.addSublayer(mainLayer)
//    }
//    
//    private func showBottomText(){
//        
//        
//    }
//    
//    private func showTextBesideHorizontalLine(){
//        
////        let lines = presenter.computeHorizontalLines(viewHeight: self.frame.height, viewWidth: self.frame.width)
////        
////        lines.forEach { (line) in
////            
////            let yPos =  self.frame.height - (value * self.frame.height)
////            
////            mainLayer.addTextLayer(
////                frame: CGRect(x: self.frame.width, y: <#T##CGFloat#>, width: 50, height: 50),
////                color: UIColor.gray.cgColor,
////                fontSize: 12,
////                text: line.text
////            )
////        }
//        
//    }
//    
//    
//    private func showBarChart(entry: BarChartEntry) {
//        mainLayer.addRectangleLayer(frame: entry.barFrame, color: entry.data.color.cgColor)
//    }
//    
//    private func showHorizontalLines() {
//        
//        let lines = presenter.computeHorizontalLines(viewHeight: self.frame.height, viewWidth: self.frame.width)
//        lines.forEach { (line) in
//            mainLayer.addLineLayer(lineSegment: line.segment, color: UIColor.gray.cgColor, width: line.width, isDashed: false)
//        }
//        
//    }
//    
//}
