//
//  Fundr_appApp.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

import SwiftUI

@main
struct Fundr_appApp: App {
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(network)
        }
    }
}
