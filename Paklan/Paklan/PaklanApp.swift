//
//  PaklanApp.swift
//  Paklan
//
//  Created by Felipe Lima on 11/6/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct PaklanApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AuthenticationController()
            Authentication()
                .environmentObject(viewModel)
        }
    }
}
