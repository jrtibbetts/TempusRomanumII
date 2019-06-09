//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockFace : View {
    
    @EnvironmentObject private var settings: ClockSettings
    
    @EnvironmentObject private var tempus: Tempus
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let frame = CGRect(x: 0.0, y: 0.0, width: width, height: width)
                    path.addEllipse(in: frame)
                    }
                    .fill(LinearGradient(gradient: .init(colors: [self.settings.daylightColor, self.settings.nighttimeColor]),
                                         startPoint: .init(x: 0.5, y: 0.0),
                                         endPoint: .init(x: 0.5, y: 0.4))
                )
                
                ClockBorder()
                    .environmentObject(self.settings)
            }
        }
            .padding(10)
    }

}

#if DEBUG
struct ClockFace_Previews : PreviewProvider {
    static var previews: some View {
        let tempus = Tempus()
        let twelve01am = Calendar.current.startOfDay(for: Date())
        let sunrise = twelve01am.addingTimeInterval(6 * 60 * 60)
        let sunset = twelve01am.addingTimeInterval(19 * 60 * 60)
        tempus.sunriseSunset = SunriseSunset(sunrise: sunrise, sunset: sunset)
        
        return ClockFace()
            .environmentObject(tempus)
            .environmentObject(ClockSettings())
    }
}
#endif
