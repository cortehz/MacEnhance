//
//  MacEnhanceApp.swift
//  MacEnhance
//
//  Created by Samuel Enyi Omanchi on 15.06.24.
//

import SwiftUI

@main
struct MacEnhanceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
          WindowGroup {
              ContentView()
                  .environment(\.managedObjectContext, persistenceController.container.viewContext)
          }
      }}


