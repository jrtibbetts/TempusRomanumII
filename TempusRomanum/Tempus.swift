//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI
import WeatherKit

/// Tracks the current time and formats it in the Roman style (e.g. *quinta hora noctis*)
/// or modern 12- or 24-hour style.
final public class Tempus: ObservableObject {
    
    // MARK: - Observed Properties
    
    /// The current date's sunrise and sunset times. If this is non-`nil`, then the Roman
    /// time can be obtained from `romanTimeString`.
    @Published public var sunEvents: SunEvents?

    /// The clock time. Changes are propagated to subscribers.
    @Published public var time = Date()

    /// Determines whether `modernTimeString` should be in 12- or 24- hour
    /// style. Changes are propagated to subscribers.
    @Published public var useMilitaryTime = false
    
    // MARK: - Public Properties

    /// The modern representation of the current time, in either short
    /// (`3:24 PM`) or military (`1524`) style, depending on the value of
    /// `useMilitaryTime`.
    public var modernTimeString: String {
        if useMilitaryTime {
            return militaryDateFormatter.string(from: Date())
        } else {
            return dateFormatter.string(from: Date())
        }
    }
    
    public var romanTimeString: String? {
        return sunEvents?.romanHour()?.string
    }
    
    public var updateInterval: TimeInterval? = 60.0 {
        didSet {
            if let interval = updateInterval {
                timer?.invalidate()
                timer = Timer.scheduledTimer(withTimeInterval: interval,
                                             repeats: true) { _ in
                    self.time = Date()
                }
            }
        }
    }

    // MARK: - Private Properties
    
    private var timer: Timer?

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

}
