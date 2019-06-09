//  Copyright © 2019 Poikile Creations. All rights reserved.

import Combine
import SwiftUI

final public class ClockSettings: BindableObject {

    // MARK: - Bound Properties
    
    public var daylightColor = Color("Daylight") {
        didSet { didChange.send(self) }
    }
    
    public var modernMarkSize = Length(10) {
        didSet { didChange.send(self) }
    }
    
    public var nighttimeColor = Color("Nighttime") {
        didSet { didChange.send(self) }
    }
    
    public var showModernMarks = true {
        didSet { didChange.send(self) }
    }

    // MARK: - Public Properties
    
    public let didChange = PassthroughSubject<ClockSettings, Never>()

}
