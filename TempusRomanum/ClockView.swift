//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockView : View {

    @EnvironmentObject private var romanTime: RomanTime
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        return formatter
    }()
    
    private var militaryDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        
        return formatter
    }()
    
    private var timeString: String {
        if romanTime.useMilitaryTime {
            return militaryDateFormatter.string(from: Date())
        } else {
            return dateFormatter.string(from: Date())
        }
    }
    
    var body: some View {
        VStack {
            Button(action: { self.romanTime.useMilitaryTime.toggle() },
                   label: {
                    Text(self.timeString)
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
