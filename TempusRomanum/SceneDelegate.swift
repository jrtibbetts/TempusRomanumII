//  Copyright © 2019 Poikile Creations. All rights reserved.

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        // Use a UIHostingController as window root view controller
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let clock = Clock()
                .environmentObject(ClockSettings())
                .environmentObject(Tempus())
            window.rootViewController = UIHostingController(rootView: clock)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}

