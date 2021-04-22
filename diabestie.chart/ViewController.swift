//
//  ViewController.swift
//  diabestie.chart
//
//  Created by Dhiky Aldwiansyah on 21/04/21.
//

import UIKit

struct LineSegment {
    let startPoint: CGPoint
    let endPoint: CGPoint
}

struct HorizontalLine {
    let segment: LineSegment
    let width: CGFloat
    let text: String
    let heightMultiplier: CGFloat
}

class ViewController: UIViewController {

    @IBOutlet weak var barChart: UIView!
    
    let mainLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupBarChart()
        
    }
    
    func setupBarChart(){
        
        mainLayer.frame = barChart.bounds
        self.barChart.layer.addSublayer(mainLayer)
        
        addHorizontalLine()
        addHorizontalLineText()
        addBottomText()
        addBarChart()
        
    }
    
    func addHorizontalLine(){
        let lines = computeHorizontalLine()
        
        lines.forEach { (line) in
            mainLayer.addLineLayer(lineSegment: line.segment, color: UIColor.gray.cgColor, width: line.width, isDashed: false)
        }
        
    }
    
    func computeHorizontalLine() -> [HorizontalLine] {
        
        var lines = [HorizontalLine]()
        
        let data = [
            (heightMultiplier: CGFloat(0.0), text: "0"),
            (heightMultiplier: CGFloat(0.5), text: "\(self.barChart.frame.height / 2)"),
            (heightMultiplier: CGFloat(1.0), text: "\(self.barChart.frame.height)")
        ]
        
        data.forEach { (heightMultiplier, text) in
            
            let yPos = self.barChart.frame.height - (heightMultiplier * self.barChart.frame.height)
            let lineWidth = self.barChart.frame.width - 100
            
            let lineSegment = LineSegment(
                startPoint: CGPoint(x: 0, y: yPos),
                endPoint: CGPoint(x: lineWidth, y: yPos)
            )
             
            lines.append(HorizontalLine(segment: lineSegment, width: 0.5, text: text, heightMultiplier: heightMultiplier))

        }
        
        return lines
    }
    
    func addHorizontalLineText(){
        let lines = computeHorizontalLine()
        
        lines.forEach { (line) in
            
            let xPos = self.barChart.frame.width - 100
            let yPos = self.barChart.frame.height - (line.heightMultiplier * self.barChart.frame.height) - 8
            
            mainLayer.addTextLayer(
                frame: CGRect(x: xPos, y: yPos, width: 50, height: 50),
                color: UIColor.gray.cgColor,
                fontSize: 12,
                text: line.text
            )
        }
        
    }
    
    func addBottomText(){
        
        let data = [
            (heightMultiplier: CGFloat(1.0), text: "2020"),
            (heightMultiplier: CGFloat(0.7), text: "2021"),
            (heightMultiplier: CGFloat(0.4), text: "2022")
        ]
        
        data.forEach { (heightMultiplier, text) in
            
            let xPos = self.barChart.frame.width - (heightMultiplier * self.barChart.frame.width)
                        
            mainLayer.addTextLayer(
                frame: CGRect(x: xPos, y: self.barChart.frame.height, width: 50, height: 50),
                color: UIColor.gray.cgColor,
                fontSize: 12,
                text: text
            )
        }
        
    }
    
    func addBarChart(){
        
        let data = [
            (widthMultiplier: CGFloat(1.0), text: "2020", value: 100),
            (widthMultiplier: CGFloat(0.7), text: "2021", value: 150),
            (widthMultiplier: CGFloat(0.4), text: "2022", value: 200)
        ]
        
        data.forEach { (widthMultiplier, text, value) in

            let barCalculatedHeight = (CGFloat(value) / self.barChart.frame.height) * self.barChart.frame.height
            
            let xPos = CGFloat(self.barChart.frame.width - (widthMultiplier * self.barChart.frame.width))
            let yPos = CGFloat(self.barChart.frame.height - barCalculatedHeight)

            mainLayer.addRectangleLayer(frame: CGRect(x: xPos, y: yPos, width: 50, height: CGFloat(value)), color: UIColor.gray.cgColor)

        }
        
    }
    
}

