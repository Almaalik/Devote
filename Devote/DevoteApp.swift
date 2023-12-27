//
//  DevoteApp.swift
//  Devote
//
//  Created by Abdul Maalik on 12/09/23.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isdarkMode") private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
