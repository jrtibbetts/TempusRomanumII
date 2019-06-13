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
    
    static var previews: some View {
        Clock()
            .environmentObject(ClockSettings())
            .environmentObject(Tempus.debugInstance)
    }
}
#endif
