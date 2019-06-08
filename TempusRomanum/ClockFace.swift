//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockFace : View {
    
    @EnvironmentObject private var tempus: Tempus

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let frame = CGRect(x: 0.0, y: 0.0, width: width, height: width)
                
                path.addEllipse(in: frame)
            }
                .fill(LinearGradient(gradient: .init(colors: [Color("Daylight"), Color("Nighttime")]), startPoint: .init(x: 0.5, y: 0.0), endPoint: .init(x: 0.5, y: 0.4)))
        }
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
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
    }
}
#endif
