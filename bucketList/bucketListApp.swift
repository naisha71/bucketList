//
//  bucketListApp.swift
//  bucketList
//
//  Created by Scholar on 30/07/2024.
//

import SwiftUI
import SwiftData

@main
struct bucketListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
