//
//  ViewController.swift
//  diabestie.chart
//
//  Created by Dhiky Aldwiansyah on 21/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barChart: BarChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        barChart.updateDataEntries(dataEntries: generateBarchartEntry(), animated: true)
        
    }
    
    func generateBarchartEntry() -> [BarDataEntry] {
        
        var result: [BarDataEntry] = .init()
        let entries = [08,12,16]
        let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
        
        entries.forEach({ (time) in
            let value = (arc4random() % 90) + 100
            
            print("value \(value)")
            let height: Float = Float(value)
            
            result.append(BarDataEntry(color: colors[time % colors.count], height: height, time: Float(time)))
        })
        
        return result
    }
}

