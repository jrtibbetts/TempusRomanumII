//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockHand: View {
    
    @EnvironmentObject var tempus: Tempus
    
    @State var angle = Angle(radians: 0)
    
    @State var color = Color.red
    
    @State var lineWidth: CGFloat = 1.0

    @State var multiplier: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width
                let center = CGPoint(x: width / 2.0, y: height / 2.0)
                let radius = center.x
                let length = self.multiplier * radius
                path.move(to: center)
                let cosine = CGFloat(cos(self.angle.radians))
                let sine = CGFloat(sin(self.angle.radians))
                path.addLine(to: CGPoint(x: center.x + cosine * length,
                                         y: center.y + sine * length))
            }
                .stroke(self.color,
                        lineWidth: self.lineWidth)
        }
    }
    
}

struct ClockHands : View {
    
    @EnvironmentObject var settings: ClockSettings
    
    @EnvironmentObject var tempus: Tempus
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    ClockHand(angle: tempus.time.hour24RotationAngle,
                              color: settings.hourHandColor,
                              lineWidth: 5.0,
                              multiplier: settings.hourHandLengthProportion)
                    
                    ClockHand(angle: tempus.time.minutesAngle,
                              color: settings.minuteHandColor,
                              lineWidth: 3.0,
                              multiplier: settings.minuteHandLengthProportion)
                }
                .environmentObject(tempus)
            }
        }
    }

}

struct ClockHands_Previews : PreviewProvider {
    
    static var previews: some View {
        ZStack {
            ClockBorder()

            ClockHands()
                .environmentObject(Tempus())
        }
        .environmentObject(ClockSettings())
    }
}
