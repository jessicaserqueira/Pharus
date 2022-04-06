//
//  CircleProgressView.swift
//  Pharus
//
//  Created by Victor Colen on 31/03/22.
//

import UIKit

class CircleProgressView: UIView {
    
    var circleLayer = CAShapeLayer()
    var completionBarLayer = CAShapeLayer()
    
    lazy var circleColor = UIColor.white {
        didSet {
            circleLayer.strokeColor = circleColor.cgColor
        }
    }
    
    lazy var completionBarColor = UIColor.white {
        didSet {
            completionBarLayer.strokeColor = completionBarColor.cgColor
        }
    }
    
    lazy var completionPercentage: Float = 0.0 {
        didSet {
            makeCircularPath(completionPercentage: (completionPercentage))
        }
    }
    
    lazy var circleRadius: CGFloat = 40.0
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCircularPath(completionPercentage: Float) {
        
        //Circular corner radius
        self.layer.cornerRadius = self.frame.size.width/2
        
        let completionBarLayerPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                                     y: frame.size.height/2),
                                                  radius: self.circleRadius,
                                                  startAngle: CGFloat(0).toRadians(),
                                                  endAngle: CGFloat(360).toRadians() * CGFloat(completionPercentage)/100,
                                                  clockwise: true)
        
        let circleLayerPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                              y: frame.size.height/2),
                                           radius: self.circleRadius,
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
