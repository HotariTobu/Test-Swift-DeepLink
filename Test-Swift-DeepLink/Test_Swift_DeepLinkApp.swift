//
//  Test-Swift-DeepLinkApp.swift
//  Test-Swift-DeepLink
//
//  Created by HotariTobu on 2022/02/17.
//

import SwiftUI

@main
struct Test_Swift_DeepLinkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NotificationModel())
        }
    }
}
