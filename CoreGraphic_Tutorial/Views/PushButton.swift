//
//  PushButton.swift
//  CoreGraphic_Tutorial
//
//  Created by 김우성 on 2021/08/30.
//

import UIKit

@IBDesignable
class PushButton: UIButton {

    @IBInspectable var fillColor: UIColor = .green
    @IBInspectable var isAddButton: Bool = true
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        
        // 너비와 높이 변수를 세팅한다.
        // 수평 스트로크 변수 세팅
        let plusWidth = min(bounds.width, bounds.height)
            * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        // path 생성한다.
        let plusPath = UIBezierPath()
        
        // path의 두께를 설정한다.
        plusPath.lineWidth = Constants.plusLineWidth
        
        // 수평으로 선을 그리기 위해 path의 시작지점으로 이동하고
        plusPath.move(to: CGPoint(
                        x: halfWidth - halfPlusWidth + Constants.halfPointShift,
                        y: halfHeight + Constants.halfPointShift))
        
        // (수평으로 선을 그리기 위해) path의 종료지점을 추가한다.
        plusPath.addLine(to: CGPoint(
                            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
                            y: halfHeight + Constants.halfPointShift))
        // plus 버튼이면 수직선을 추가한다.
        if isAddButton {
            // 수직선을 추가한다.
            plusPath.move(to: CGPoint(
              x: halfWidth + Constants.halfPointShift,
              y: halfHeight - halfPlusWidth + Constants.halfPointShift))
                  
            plusPath.addLine(to: CGPoint(
              x: halfWidth + Constants.halfPointShift,
              y: halfHeight + halfPlusWidth + Constants.halfPointShift))
        }
        
        // 스트로크의 색상을 선택한다.
        UIColor.white.setStroke()
        
        // 선을 그린다.
        plusPath.stroke()
        
        
    }
    

}
