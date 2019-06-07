//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockView : View {
    
    @State var showMilitaryTime = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showMilitaryTime.toggle()
            }) {
                Text("11:31 PM")
                    .font(.headline)
            }
            
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
    }
}
#endif
