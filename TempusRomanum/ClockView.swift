//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockView : View {

    @EnvironmentObject private var tempus: Tempus
    
    var body: some View {
        VStack {
            // Switches between 12- and 24-hour style.
            Button(action: { self.tempus.useMilitaryTime.toggle() },
                   label: {
                    Text(self.tempus.modernTimeString)
                        .frame(minWidth: 100)
                        .font(.headline)
                    }
            )

            if self.tempus.romanTimeString != nil {
                Text(self.tempus.romanTimeString!)
                    .font(.subheadline)
                    .italic()
                    .padding(.top, 8)
            }
        }
    }
    
}

#if DEBUG
struct Clock_Previews : PreviewProvider {
    static var previews: some View {
        let tempus = Tempus()
        tempus.updateInterval = 60.0  // every minute
        
        let twelve01am = Calendar.current.startOfDay(for: Date())
        let sunrise = twelve01am.addingTimeInterval(6 * 60 * 60)
        let sunset = twelve01am.addingTimeInterval(19 * 60 * 60)
        tempus.sunriseSunset = SunriseSunset(sunrise: sunrise, sunset: sunset)
        
        return ClockView()
            .environmentObject(tempus)
    }
}
#endif
