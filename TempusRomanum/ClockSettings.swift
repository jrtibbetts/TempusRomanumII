//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI

final public class ClockSettings: BindableObject {

    // MARK: - Bound Properties
    
    public var borderColor = Color.black {
        didSet { didChange.send(self) }
    }
    
    public var borderWidth = Length(3) {
        didSet { didChange.send(self) }
    }
    
    public var daylightColor = Color("Daylight") {
        didSet { didChange.send(self) }
    }
    
    public var hourHandLengthProportion = 0.8 {
        didSet { didChange.send(self) }
    }
    
    public var minuteHandLengthProportion = 0.5 {
        didSet { didChange.send(self) }
    }

    public var modernMarkLength = Length(10) {
        didSet { didChange.send(self) }
    }
    
    public var nighttimeColor = Color("Nighttime") {
        didSet { didChange.send(self) }
    }
    
    public var showModernMarks = true {
        didSet { didChange.send(self) }
    }

    // MARK: - BindableObject Properties
    
    public let didChange = PassthroughSubject<ClockSettings, Never>()

}
