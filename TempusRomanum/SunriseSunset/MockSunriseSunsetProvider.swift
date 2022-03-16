//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

struct SimpleSunriseSunset: SunriseSunset, Codable {

    var sunrise: Date

    var sunset: Date

    init(sunrise: Date, sunset: Date) {
        self.sunrise = sunrise
        self.sunset = sunset
    }

}

open class MockSunriseSunsetProvider: SunriseSunsetProvider {

    public func sunriseSunset() async -> SunriseSunset {
        let startOfToday = Calendar.current.startOfDay(for: Date())
        let sunrise = startOfToday.addingTimeInterval(5.3 * 60.0 * 60.0)
        let sunset = startOfToday.addingTimeInterval(19.12 * 60.0 * 60.0)
        
        return SimpleSunriseSunset(sunrise: sunrise, sunset: sunset)
    }

}
