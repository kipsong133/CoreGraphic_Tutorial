//
//  CounterView.swift
//  CoreGraphic_Tutorial
//
//  Created by 김우성 on 2021/08/30.
//

import UIKit

@IBDesignable class CounterView: UIView {
    
    private struct Constants {
        
        // 하루에 마실 물잔의 수
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    // 몇 잔 마셨는지 저장할 프로퍼티
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        
        // 정중앙 지점을 상수로 생성한다.
        let center = CGPoint(x: bounds.width / 2,
                             y: bounds.height / 2)
        
        // 두 값중 큰 값을 상수로 할당한다.
        let radius = max(bounds.width, bounds.height)
        
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        // 각도 차이에 대한 값을 설정한다.
        // 절대값으로 나오도록 2파이에서 현재 각도를 뺀다.
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        
        // 색칠된 전체 도넛에서 물 마신만큼 나눈다.
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        
        // 물 마신 만큼의 각도를 계산한다.
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        // 외각 반지름
        let outerArcRadius = bounds.width/2 - Constants.halfOfLineWidth
        
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: outerArcRadius,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        let innerArcRadius = bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth
        
        outlinePath.addArc(withCenter: center,
                           radius: innerArcRadius,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        
    }
}
