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
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        makeCircularPath(endAnglePercentage: CGFloat(percentage))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   var progressColor = UIColor.white {
      didSet {
         progressLayer.strokeColor = progressColor.cgColor
      }
   }
   var trackColor = UIColor.white {
      didSet {
         trackLayer.strokeColor = trackColor.cgColor
      }
   }
    
    var percentage = 0.0 {
        didSet {
            makeCircularPath(endAnglePercentage: percentage)
        }
    }
    
    func makeCircularPath(endAnglePercentage: CGFloat) {
      self.backgroundColor = UIColor.clear
      self.layer.cornerRadius = self.frame.size.width/2
      let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2,
                                                       y: frame.size.height/2),
                                    radius: 50,
                                    startAngle: CGFloat(0).toRadians(),
                                    endAngle: CGFloat(360).toRadians() * (endAnglePercentage/100),
                                    clockwise: true)
       
      trackLayer.path = circlePath.cgPath
      trackLayer.fillColor = UIColor.clear.cgColor
      trackLayer.strokeColor = trackColor.cgColor
      trackLayer.lineWidth = 15
      trackLayer.strokeEnd = 1.0
      layer.addSublayer(trackLayer)
       
      progressLayer.path = circlePath.cgPath
      progressLayer.fillColor = UIColor.clear.cgColor
      progressLayer.strokeColor = progressColor.cgColor
      progressLayer.lineWidth = 20.0
      progressLayer.strokeEnd = 0.0
      layer.addSublayer(progressLayer)
   }
}
