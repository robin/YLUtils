import Foundation
import UIKit

public func viewWithLayer(layer: CALayer, size: CGSize = CGSize(width: 300, height: 300)) -> UIView {
    let view = UIView(frame: CGRect(origin: .zero, size: size))
    layer.bounds = view.bounds
    layer.position = view.center
    view.layer.addSublayer(layer)
    return view
}

public func viewWithPath(path: UIBezierPath, size: CGSize = CGSize(width: 300, height: 300)) -> UIView {
    let layer = CAShapeLayer()
    layer.strokeColor = UIColor.whiteColor().CGColor
    layer.path = path.CGPath
    return viewWithLayer(layer, size: size)
}