import SwiftUI

/**
 Shape of tabBar.
 */
struct TabBarShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let arcMultiplier = 0.3
        let arcRadius = rect.height * arcMultiplier

        path.addArc(center: CGPoint(x: arcRadius, y: arcRadius),
                    radius: arcRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)

        path.addArc(center: CGPoint(x: rect.maxX - arcRadius,
                                    y: rect.minY + arcRadius),
                    radius: arcRadius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(0),
                    clockwise: false)

        path.addArc(center: CGPoint(x: rect.maxX - arcRadius,
                                    y: rect.maxY - arcRadius),
                    radius: arcRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: false)

        path.addArc(center: CGPoint(x: rect.minX + arcRadius,
                                    y: rect.maxY - arcRadius),
                    radius: arcRadius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(180),
                    clockwise: false)

        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + arcRadius))

        return path
    }
}
