//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI

final public class ClockSettings: ObservableObject {

    // MARK: - Bound Properties
    
    public var borderColor = Color.black {
        didSet { didChange.send(self) }
    }
    
    public var borderWidth = CGFloat(3) {
        didSet { didChange.send(self) }
    }
    
    public var daylightColor = Color("Daylight") {
        didSet { didChange.send(self) }
    }
    
    public var hourHandColor = Color.red {
        didSet { didChange.send(self) }
    }
    
    public var hourHandLengthProportion = CGFloat(0.5) {
        didSet { didChange.send(self) }
    }
    
    public var minuteHandColor = Color.orange {
        didSet { didChange.send(self)}
    }
    
    public var minuteHandLengthProportion = CGFloat(0.8) {
        didSet { didChange.send(self) }
    }

    public var modernMarkLength = CGFloat(10) {
        didSet { didChange.send(self) }
    }
    
    public var nighttimeColor = Color("Nighttime") {
        didSet { didChange.send(self) }
    }
    
    public var showModernMarks = true {
        didSet { didChange.send(self) }
    }

    // MARK: - ObservableObject Properties
    
    public let didChange = PassthroughSubject<ClockSettings, Never>()

}
