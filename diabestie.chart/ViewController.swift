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
    let weight: CGFloat
    let text: String
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
        
    }
    
    func addHorizontalLine(){
        let lines = computeHorizontalLine()
        
        lines.forEach { (line) in
            mainLayer.addLineLayer(lineSegment: line.segment, color: UIColor.gray.cgColor, weight: line.weight)
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
            
            let lineSegment = LineSegment(
                startPoint: CGPoint(x: 0, y: yPos),
                endPoint: CGPoint(x: self.barChart.frame.width, y: yPos)
            )
             
            lines.append(HorizontalLine(segment: lineSegment, weight: 0.5, text: text))

        }
        
        return lines
    }
    
    func addHorizontalLineText(){
        
    }
    
    func addBottomText(){
    }
    
    func addBarChart(){
        
    }
}

