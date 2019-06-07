//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockView : View {

    @EnvironmentObject private var romanTime: RomanTime
    
    var body: some View {
        VStack {
            Button(action: { self.romanTime.useMilitaryTime.toggle() },
                   label: {
                    Text(self.romanTime.timeString)
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
        ClockView()
            .environmentObject(RomanTime())
    }
}
#endif
