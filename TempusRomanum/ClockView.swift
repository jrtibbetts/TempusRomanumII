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

            Text("quinta hora noctis")
                .font(.subheadline)
                .italic()
                .padding(.top, 10)
        }
    }
    
}

#if DEBUG
struct Clock_Previews : PreviewProvider {
    static var previews: some View {
        let tempus = Tempus()
        tempus.updateInterval = 60.0  // every minute
        
        return ClockView()
            .environmentObject(tempus)
    }
}
#endif
