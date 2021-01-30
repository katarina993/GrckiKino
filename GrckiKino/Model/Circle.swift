//
//  Ring.swift
//  GrckiKino
//
//  Created by Katarina Tomic on 1/29/21.
//

import Foundation
import UIKit


class Circle: UIView {
    override func draw(_ rect: CGRect) {
        let radius: Float = 15
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: center.x, y: center.y), radius: CGFloat(radius), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}
