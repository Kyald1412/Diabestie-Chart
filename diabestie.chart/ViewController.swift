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
        let line = computeHorizontalLine()
        mainLayer.addLineLayer(lineSegment: line.segment, color: UIColor.gray.cgColor, width: line.width, isDashed: false)
    }
    
    func computeHorizontalLine() -> HorizontalLine {
        let lineSegment = LineSegment(startPoint: CGPoint(x: 0, y: self.barChart.frame.height), endPoint: CGPoint(x: self.barChart.frame.width, y: self.barChart.frame.height))
        let line = HorizontalLine(segment: lineSegment, width: 0.5, text: "0")
        return line
    }
    
    func addHorizontalLineText(){
        
    }
   
}

