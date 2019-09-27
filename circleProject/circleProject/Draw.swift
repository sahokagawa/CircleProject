//
//  Draw.swift
//  circleProject
//
//  Created by 香川紗穂 on 2019/09/27.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

import UIKit

class Draw: UIView {

    var penColor = UIColor.black
    var penSize: CGFloat = 6.0
    private var path: UIBezierPath!
    private var lastDrawImage: UIImage!
    
    override func draw(_ rect: CGRect) {
        lastDrawImage?.draw(at: CGPoint.zero)
        penColor.setStroke()
        path?.stroke()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)
        path = UIBezierPath()
        path?.lineWidth = penSize
        path?.lineCapStyle = CGLineCap.round
        path?.lineJoinStyle = CGLineJoin.round
        path?.move(to: currentPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)
        path?.addLine(to: currentPoint)
        setNeedsDisplay()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let currentPoint = touches.first!.location(in: self)
        path.addLine(to: currentPoint)
        lastDrawImage = snapShot()
        setNeedsDisplay()
    }
    
    func snapShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        lastDrawImage?.draw(at: CGPoint.zero)
        penColor.setStroke()
        path?.stroke()
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}
