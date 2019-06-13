//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI

/// Tracks the current time and formats it in the Roman style (e.g. *quinta hora noctis*)
/// or modern 12- or 24-hour style.
final public class Tempus: BindableObject {
    
    // MARK: - Observed Properties
    
    /// The current date's sunrise and sunset times. If this is non-`nil`, then the Roman
    /// time can be obtained from `romanTimeString`.
    public var sunriseSunset: SunriseSunset? = nil {
        didSet {
            didChange.send(self)
        }
    }

    /// The clock time. Changes are propagated to subscribers.
    public var time = Date() {
        didSet { didChange.send(self) }
    }
    
    /// Determines whether `modernTimeString` should be in 12- or 24- hour
    /// style. Changes are propagated to subscribers.
    public var useMilitaryTime = false {
        didSet { didChange.send(self) }
    }
    
    // MARK: - Public Properties
    
    public let didChange = PassthroughSubject<Tempus, Never>()

    /// The modern representation of the current time, in either
    /// short (`3:24 PM`) or military (`1524`) style, depending on
    /// the value of `useMiltaryTime`,
    public var modernTimeString: String {
        if useMilitaryTime {
            return militaryDateFormatter.string(from: Date())
        } else {
            return dateFormatter.string(from: Date())
        }
    }
    
    public var romanTimeString: String? {
        return sunriseSunset?.romanHour()?.string
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
            
            didChange.send(self)
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
