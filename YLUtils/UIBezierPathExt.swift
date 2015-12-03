//
//  UIBezierPathExt.swift
//  
//
//  Created by Yibin Lu on 12/3/15.
//
//

import Foundation
import UIKit

/// The direction to the next point
enum UIBezierPathDirection {
    case Up
    case Down
    case Left
    case Right
    case Angle(Double)
}

extension UIBezierPath {

    /// Get the point by direction and offset
    func toPoint(direction: UIBezierPathDirection, offset: CGFloat) -> CGPoint {
        var toPoint = self.currentPoint
        switch direction {
        case .Up:
            toPoint.y -= offset
        case .Down:
            toPoint.y += offset
        case .Left:
            toPoint.x -= offset
        case .Right:
            toPoint.x += offset
        case let .Angle(angle):
            toPoint.x += offset * CGFloat(cos(angle))
            toPoint.y += offset * CGFloat(sin(angle))
        }
        return toPoint
    }

    func angleFor(factor: Double) -> CGFloat {
        return CGFloat(factor * M_PI)
    }

    func moveTo(direction: UIBezierPathDirection, offset: CGFloat) {
        moveToPoint(toPoint(direction, offset: offset))
    }

    func addLineTo(direction: UIBezierPathDirection, offset: CGFloat) {
        addLineToPoint(toPoint(direction, offset: offset))
    }
    
}

