import SwiftUI

/**
 Shape of tabBar.
 */
struct TabBarShape: Shape {

    /**
     Indication of need to add space for Notion button.
     */
    let addNotionButtonArc: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let arcMultiplier = 0.3
        let arcRadius = rect.height * arcMultiplier

        path.addArc(center: CGPoint(x: arcRadius, y: arcRadius),
                    radius: arcRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)

        if addNotionButtonArc {
            let notionButtonHeightMultiplier = 0.6
            let notionButtonRadius = rect.height * notionButtonHeightMultiplier

            path.addLine(to: CGPoint(x: rect.midX - notionButtonRadius,
                                     y: rect.minY))

            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: notionButtonRadius,
                        startAngle: .degrees(180),
                        endAngle: .degrees(0),
                        clockwise: true)

            path.addLine(to: CGPoint(x: rect.maxX - arcRadius, y: rect.minY))
        }
        else {
            path.addLine(to: CGPoint(x: rect.maxX - arcRadius, y: rect.minY))
        }

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
