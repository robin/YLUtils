//: [Previous](@previous)

import UIKit
import Foundation
@testable import YLUtils

let path = UIBezierPath()
path.moveTo(.Down, offset: 100)
path.moveTo(.Right, offset: 100)
path.addArcWithCenter(path.toPoint(.Down, offset: 5), radius: 5, startAngle: UIBezierPath.angleFor(1.5), endAngle: UIBezierPath.angleFor(0.5), clockwise: false)
path.addLineTo(.Right, offset: 50)
path.addLineTo(.Down, offset: 50)
path.addArcWithCenter(path.toPoint(.Right, offset: 5), radius: 5, startAngle: UIBezierPath.angleFor(1), endAngle: UIBezierPath.angleFor(0), clockwise: false)
path.addLineTo(.Up, offset: 50)
path.addLineTo(.Right, offset: 50)
path.addArcWithCenter(path.toPoint(.Up, offset: 5), radius: 5, startAngle: UIBezierPath.angleFor(0.5), endAngle: UIBezierPath.angleFor(1.5), clockwise: false)
path.addLineTo(.Left, offset: 50)
path.addLineTo(.Up, offset: 50)
path.addArcWithCenter(path.toPoint(.Left, offset: 5), radius: 5, startAngle: UIBezierPath.angleFor(0), endAngle: UIBezierPath.angleFor(1), clockwise: false)
path.addLineTo(.Down, offset: 50)
path.closePath()
path.moveTo(.Right, offset: 155)
path.addArcWithCenter(CGPoint(x: 155, y: 105), radius: 100, startAngle: 0, endAngle: UIBezierPath.angleFor(2), clockwise: true)


viewWithPath(path)


path.rotate(CGPoint(x: 155, y: 105), angle: UIBezierPath.angleFor(0.25))
viewWithPath(path)

let path2 = UIBezierPath()
path2.moveTo(.Angle(M_PI_4), offset: 141.421)
path2.addOutlineTo(.Right, offset: 100, weight: 10)
path2.addOutlineTo(.Down, offset: 100, weight: 10)
path2.flatness
viewWithPath(path2)
//: [Next](@next)
