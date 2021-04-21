//
//  BarChart.swift
//  diabestie.chart
//
//  Created by Dhiky Aldwiansyah on 21/04/21.
//

import Foundation
import UIKit

class BarChart: UIView {

    private let mainLayer: CALayer = CALayer()
    private let presenter = BasicBarChartPresenter()
    
    private var barEntries: [BarChartEntry] = [] {
        didSet {
            mainLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
            
            mainLayer.frame = CGRect(x: 16, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            
            showHorizontalLines()
            showVerticalLines()
            bottomTextLayer()
         
            for (index, entry) in barEntries.enumerated() {
                showBarChart(index: index, entry: entry)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateDataEntries(dataEntries: presenter.dataEntries, animated: false)
    }
    
    func updateDataEntries(dataEntries: [BarDataEntry], animated: Bool) {
        self.presenter.dataEntries = dataEntries
        self.barEntries = self.presenter.computeBarEntries(viewHeight: self.frame.height, viewWidth: self.frame.width)
    }
    
    private func setupView() {
        
        self.layer.addSublayer(mainLayer)
    }
    
    private func bottomTextLayer(){

        for (index, data) in self.presenter.bottomTitleText.enumerated() {
            let xPos = CGFloat(index) * (self.frame.width/4-20)
                        
            mainLayer.addTextLayer(frame: CGRect.init(x: xPos, y: self.frame.height - 30, width: 20, height: 20), color: UIColor.gray.cgColor, fontSize: 12, text: data)
        }
        
    }
    
    private func showBarChart(index: Int, entry: BarChartEntry) {
        
        let cgColor = entry.data.color.cgColor
        
        // Show the main bar
        mainLayer.addRectangleLayer(frame: entry.barFrame, color: cgColor)

    }
    
    private func showHorizontalLines() {
        self.layer.sublayers?.forEach({
            if $0 is CAShapeLayer {
                $0.removeFromSuperlayer()
            }
        })
        let lines = presenter.computeHorizontalLines(viewHeight: self.frame.height, viewWidth: self.frame.width)
        lines.forEach { (line) in
            mainLayer.addLineLayer(lineSegment: line.segment, color: UIColor.gray.cgColor, width: line.width, isDashed: false)
        }
        
        showTextBesideHorizontalLine()
    }
    
    private func showTextBesideHorizontalLine(){
        
        let lines = presenter.computeHorizontalLines(viewHeight: self.frame.height, viewWidth: self.frame.width - CGFloat(20))

        lines.forEach { (line) in
            
            let yPosition = self.frame.height - 40 -  line.value * (self.frame.height - 40 - 10)
            
            mainLayer.addTextLayer(frame: CGRect.init(x: self.frame.width - 80, y: yPosition - 10, width: 50, height: 20), color: UIColor.gray.cgColor, fontSize: 12, text: line.text)
        }
    }
    
    
    private func showVerticalLines() {
        self.layer.sublayers?.forEach({
            if $0 is CAShapeLayer {
                $0.removeFromSuperlayer()
            }
        })
        let lines = presenter.computeVerticalLines(viewHeight: self.frame.height, viewWidth: self.frame.width)
        lines.forEach { (line) in
            mainLayer.addLineLayer(lineSegment: line.segment, color: UIColor.gray.cgColor, width: line.width, isDashed: line.isDashed)
        }
    }

}
