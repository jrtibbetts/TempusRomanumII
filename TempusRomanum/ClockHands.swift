//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockHand: View {
    
    @EnvironmentObject var tempus: Tempus
    
    @State var color = Color.red
    
    @State var lineWidth: CGFloat = 1.0

    @State var multiplier: CGFloat = 1.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let size = CGSize(width: geometry.size.width, height: geometry.size.height)
                let center = CGPoint(x: size.width / 2.0,
                                     y: size.height / 2.0)
                let radius = center.x
                let length = self.multiplier * radius
                path.move(to: center)
                let cosine = CGFloat(cos(self.tempus.time.hour24RotationAngle.radians))
                let sine = CGFloat(sin(self.tempus.time.hour24RotationAngle.radians))
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
                    ClockHand(color: self.settings.hourHandColor,
                              lineWidth: 5.0,
                              multiplier: self.settings.hourHandLengthProportion)
                        .environmentObject(self.tempus)
                   
                    ClockHand(color: self.settings.minuteHandColor,
                              lineWidth: 4.0,
                              multiplier: self.settings.minuteHandLengthProportion)
                        .environmentObject(self.tempus)
                }
            }
        }
    }

}

#if DEBUG
struct ClockHands_Previews : PreviewProvider {
    static var previews: some View {
        ClockHands()
            .environmentObject(ClockSettings())
            .environmentObject(Tempus())
    }
}
#endif
