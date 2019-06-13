//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct Clock : View {
    
    @EnvironmentObject var tempus: Tempus
    
    var body: some View {
        ZStack {
            ClockFace()
            ClockBorder()
            HourLines(color: .white, dates: tempus.sunriseSunset?.nighttimeHours, thickness: 2.0)
            ClockHands()
        }
    }
    
}

#if DEBUG
struct Clock_Previews : PreviewProvider {
    
    static var tempus: Tempus = {
        let sunriseComponents = DateComponents(calendar: .current, timeZone: .current, year: 2019, month: 6, day: 12, hour: 5, minute: 44, second: 0)
        let sunsetComponents = DateComponents(calendar: .current, timeZone: .current, year: 2019, month: 6, day: 12, hour: 20, minute: 35, second: 0)
        let sunriseSunset = SimpleSunriseSunset(sunrise: sunriseComponents.date!, sunset: sunsetComponents.date!)
        let tempus = Tempus()
        tempus.sunriseSunset = sunriseSunset
        
        return tempus
    }()
    
    static var previews: some View {
        Clock()
            .environmentObject(ClockSettings())
            .environmentObject(tempus)
    }
}
#endif
