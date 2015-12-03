//: [Previous](@previous)

import UIKit
import Foundation
@testable import YLUtils

let path = UIBezierPath()
path.moveTo(.Down, offset: 100)
path.moveTo(.Right, offset: 100)
path.addArcWithCenter(path.toPoint(.Down, offset: 5), radius: 5, startAngle: path.angleFor(1.5), endAngle: path.angleFor(0.5), clockwise: false)
path.addLineTo(.Right, offset: 50)
path.addLineTo(.Down, offset: 50)
path.addArcWithCenter(path.toPoint(.Right, offset: 5), radius: 5, startAngle: path.angleFor(1), endAngle: path.angleFor(0), clockwise: false)
path.addLineTo(.Up, offset: 50)
path.addLineTo(.Right, offset: 50)
path.addArcWithCenter(path.toPoint(.Up, offset: 5), radius: 5, startAngle: path.angleFor(0.5), endAngle: path.angleFor(1.5), clockwise: false)
path.addLineTo(.Left, offset: 50)
path.addLineTo(.Up, offset: 50)
path.addArcWithCenter(path.toPoint(.Left, offset: 5), radius: 5, startAngle: path.angleFor(0), endAngle: path.angleFor(1), clockwise: false)
path.addLineTo(.Down, offset: 50)
path.closePath()

viewWithPath(path)
//: [Next](@next)
