import UIKit

class RoundedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCustomCorners()
    }

    private func applyCustomCorners() {
        let path = UIBezierPath()
        
        let topLeftRadius: CGFloat = 20
        let topRightRadius: CGFloat = 50
        let bottomRightRadius: CGFloat = 10
        let bottomLeftRadius: CGFloat = 30
        
        let rect = bounds
        
        // Начальная точка (верхний левый угол)
        path.move(to: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY))
        
        // Верхняя линия (лево -> право)
        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + topRightRadius),
                          controlPoint: CGPoint(x: rect.maxX, y: rect.minY))
        
        // Правая линия (верх -> низ)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY),
                          controlPoint: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Нижняя линия (право -> лево)
        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - bottomLeftRadius),
                          controlPoint: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Левая линия (низ -> верх)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
        path.addQuadCurve(to: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY),
                          controlPoint: CGPoint(x: rect.minX, y: rect.minY))
        
        // Создание маски
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
