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

    static func angleFor(factor: Double) -> CGFloat {
        return CGFloat(factor * M_PI)
    }


    /// Get the point by direction and offset
    func toPoint(direction: UIBezierPathDirection, offset: CGFloat, from: CGPoint? = nil) -> CGPoint {

        var toPoint = self.currentPoint
        if let from = from {
            toPoint = from
        }
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

    /// Calculate angle from the direction
    func directionToAngle(direction: UIBezierPathDirection) -> CGFloat {
        switch direction {
        case .Up:
            return UIBezierPath.angleFor(1.5)
        case .Down:
            return UIBezierPath.angleFor(0.5)
        case .Left:
            return UIBezierPath.angleFor(1.0)
        case .Right:
            return UIBezierPath.angleFor(0)
        case let .Angle(angle):
            return CGFloat(angle)
        }
    }

    /// move from current point to the direction
    func moveTo(direction: UIBezierPathDirection, offset: CGFloat) {
        moveToPoint(toPoint(direction, offset: offset))
    }

    /// add a line from current point to the direction
    func addLineTo(direction: UIBezierPathDirection, offset: CGFloat) {
        addLineToPoint(toPoint(direction, offset: offset))
    }

    /// draw the outline of a line to the direction
    func addOutlineTo(direction: UIBezierPathDirection, offset: CGFloat, weight: CGFloat, cap: CGLineCap = .Round) {
        let startPoint = self.currentPoint
        let endPoint = toPoint(direction, offset: offset, from: startPoint)
        let per = perpendicularTransform(direction)
        moveTo(per, offset: weight/2.0)
        if cap == .Square {
            moveTo(direction, offset: -weight/2.0)
        }
        let perAngle = directionToAngle(per)
        addArcWithCenter(startPoint, radius: weight/2.0, startAngle: perAngle, endAngle: perAngle - CGFloat(M_PI), clockwise: false)
        addLineTo(direction, offset: offset)
        addArcWithCenter(endPoint, radius: weight/2.0, startAngle: perAngle - CGFloat(M_PI), endAngle: perAngle, clockwise: false)
        addLineTo(direction, offset: -offset)
        moveToPoint(endPoint)
    }

    func rotate(center: CGPoint, angle: CGFloat) {
        var transform = CGAffineTransformMakeTranslation(center.x, center.y);
        transform = CGAffineTransformRotate(transform, angle);
        transform = CGAffineTransformTranslate(transform,-center.x,-center.y);
        applyTransform(transform)
    }

    private func perpendicularTransform(direction: UIBezierPathDirection) -> UIBezierPathDirection
    {
        switch direction {
        case .Up:
            return .Left
        case .Down:
            return .Right
        case .Left:
            return .Down
        case .Right:
            return .Up
        case let .Angle(angle):
            return .Angle(angle + M_PI_2)
        }
    }

}

