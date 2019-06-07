//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI

final class RomanTime: BindableObject {
    
    let didChange = PassthroughSubject<RomanTime, Never>()
    
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
    var timeString: String {
        if useMilitaryTime {
            return militaryDateFormatter.string(from: Date())
        } else {
            return dateFormatter.string(from: Date())
        }
    }

}
