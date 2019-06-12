//  Copyright © 2018 Poikile Creations. All rights reserved.

import Foundation
import SwiftUI

internal extension Date {

    var minutesAngle: Angle {
        let midnight = Calendar.current.startOfDay(for: self)
        let timeInMinutes = timeIntervalSince(midnight) / 60
        let percentage = timeInMinutes / 12.0 * 60.0 * 60.0
        
        return Angle(radians: (Double.pi / 2.0) + (Double.pi * 2 * Double(percentage)))
    }

    var hour12RotationAngle: Angle {
        let midnight = Calendar.current.startOfDay(for: self)
        let timeInMinutes = timeIntervalSince(midnight) / 60
        let percentage = timeInMinutes / 12.0 * 60.0
        
        return Angle(radians: (Double.pi / 2.0) + (Double.pi * 2 * Double(percentage)))
    }
    
    /// The angle, in radians, of the `Date`, relative to 12:00 am the same day.
    var hour24RotationAngle: Angle {
        let midnight = Calendar.current.startOfDay(for: self)
        let timeInMinutes = timeIntervalSince(midnight) / 60
        let percentage = timeInMinutes / 24.0 * 60.0
        
        return Angle(radians: (Double.pi / 2.0) + (Double.pi * 2 * Double(percentage)))
    }
    
}
