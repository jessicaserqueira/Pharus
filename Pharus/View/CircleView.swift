//
//  CircleView.swift
//  Pharus
//
//  Created by Victor Colen on 31/03/22.
//

import UIKit

class CircleView: UIView {
    
    var completionBarLayer = CAShapeLayer()
    var circleLayer = CAShapeLayer()
    
    lazy var completionBarColor = UIColor.white {
        didSet {
            completionBarLayer.strokeColor = completionBarColor.cgColor
        }
    }
    
    lazy var circleColor = UIColor.white {
        didSet {
            circleLayer.strokeColor = circleColor.cgColor
        }
    }
    
    lazy var completionPercentage = 0.0 {
        didSet {
            makeCircularPath(completionPercentage: CGFloat(completionPercentage))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCircularPath(completionPercentage: CGFloat) {
        //Circular corner radius
        self.layer.cornerRadius = self.frame.size.width/2
        
        let completionBarLayerPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                                y: frame.size.height/2),
                                             radius: 40,
                                             startAngle: CGFloat(0).toRadians(),
                                             endAngle: CGFloat(360).toRadians() * (completionPercentage/100),
                                             clockwise: true)
        
        let circleLayerPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                             y: frame.size.height/2),
                                          radius: 40,
                                          startAngle: CGFloat(0).toRadians(),
                                          endAngle: CGFloat(360).toRadians(),
                                          clockwise: true)
        
        circleLayer.path = circleLayerPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = circleColor.cgColor
        circleLayer.lineWidth = 15
        circleLayer.strokeEnd = 1.0
        layer.addSublayer(circleLayer)
        
        completionBarLayer.path = completionBarLayerPath.cgPath
        completionBarLayer.fillColor = UIColor.clear.cgColor
        completionBarLayer.strokeColor = completionBarColor.cgColor
        completionBarLayer.lineWidth = 15.0
        completionBarLayer.strokeEnd = 1.0
        completionBarLayer.lineCap = .round
        layer.addSublayer(completionBarLayer)
    }
}
