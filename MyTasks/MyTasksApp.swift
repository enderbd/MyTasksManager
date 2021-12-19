//
//  MyTasksApp.swift
//  MyTasks
//
//  Created by Maczilla on 13.12.21.
//

import SwiftUI

@main
struct MyTasksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MyTasksView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
