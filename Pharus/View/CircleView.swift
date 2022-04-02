//
//  CircleView.swift
//  Pharus
//
//  Created by Victor Colen on 31/03/22.
//

import UIKit

class CircleView: UIView {
    
    var progressLayer = CAShapeLayer()
    var trackLayer = CAShapeLayer()
    
    lazy var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    lazy var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    lazy var percentage = 0.0 {
        didSet {
            makeCircularPath(endAnglePercentage: percentage)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeCircularPath(endAnglePercentage: CGFloat) {
        self.layer.cornerRadius = self.frame.size.width/2
        
        let progressLayerPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                                y: frame.size.height/2),
                                             radius: 40,
                                             startAngle: CGFloat(0).toRadians(),
                                             endAngle: CGFloat(360).toRadians() * (endAnglePercentage/100),
                                             clockwise: true)
        
        let trackLayerPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                             y: frame.size.height/2),
                                          radius: 40,
                                          startAngle: CGFloat(0).toRadians(),
                                          endAngle: CGFloat(360).toRadians(),
                                          clockwise: true)
        
        trackLayer.path = trackLayerPath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 15
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = progressLayerPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 15.0
        progressLayer.strokeEnd = 1.0
        progressLayer.lineCap = .round
        layer.addSublayer(progressLayer)
    }
}
