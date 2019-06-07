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
    
}
