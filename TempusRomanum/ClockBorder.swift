//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockBorder : View {
    
    func edgePoints(for geometry: GeometryProxy) -> [CGFloat: CGPoint] {
        let frame = self.frame(for: geometry)
        let center = CGPoint(x: frame.size.width / 2.0,
                             y: frame.size.height / 2.0)
        let radius = center.x
        
        return (0..<24).reduce(into: [CGFloat: CGPoint]()) { (result, i) in
            let angleDegrees = CGFloat(i) / 24.0 * 360.0
            let sine = sin(angleDegrees)
            let cosine = cos(angleDegrees)
            let edgePoint = CGPoint(x: center.x + (cosine * radius),
                                    y: center.y + (sine * radius))
            result[angleDegrees] = edgePoint
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Path { path in
                        path.addEllipse(in: self.frame(for: geometry))
                    }
                        .stroke()
                    
                    Path { path in
                        let frame = self.frame(for: geometry)
                        let center = CGPoint(x: frame.size.width / 2.0,
                                             y: frame.size.height / 2.0)
                        let radius = center.x
                        
                        self.edgePoints(for: geometry).forEach { (angle, edgePoint) in
                            path.move(to: edgePoint)
                            let lineEndPoint = CGPoint(x: center.x + (cos(angle) * (radius - 20.0)),
                                                       y: center.y + (sin(angle) * (radius - 20.0)))
                            path.addLine(to: lineEndPoint)
                        }
                    }
                        .stroke()
                }
                
//                List {
//                    ForEach(self.edgePoints(for: geometry).values) { value in
//                        Text("Point foo")
//                    }
//                }
            }
        }
    }
    
    func frame(for geometry: GeometryProxy) -> CGRect {
        let width: CGFloat = min(geometry.size.width, geometry.size.height)
        let frame = CGRect(x: 0.0, y: 0.0, width: width, height: width)
        
        return frame
    }
    
}

#if DEBUG
struct ClockBorder_Previews : PreviewProvider {
    static var previews: some View {
        ClockBorder()
    }
}
#endif
