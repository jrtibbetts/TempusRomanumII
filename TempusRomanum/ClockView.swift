//  Copyright © 2019 Poikile Creations. All rights reserved.

import SwiftUI

struct ClockView : View {
    
    @State var showMilitaryTime = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.showMilitaryTime.toggle()
            }, label: { Text("11:31 PM")})
            
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
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
