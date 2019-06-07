//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI

final class Tempus: BindableObject {
    
    let didChange = PassthroughSubject<Tempus, Never>()
    
    var useMilitaryTime = false {
        didSet {
            didChange.send(self)
        }
    }
    
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
    
    // The
    var modernTimeString: String {
        if useMilitaryTime {
            return militaryDateFormatter.string(from: Date())
        } else {
            return dateFormatter.string(from: Date())
        }
    }

}
