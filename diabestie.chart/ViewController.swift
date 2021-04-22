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
    }
    
    func addHorizontalLine(){
    }
    
    func computeHorizontalLine() -> HorizontalLine {
    }
    
    func addHorizontalLineText(){
        
    }
    
    func addBottomText(){
    }
    
    func addBarChart(){
        
    }
}

