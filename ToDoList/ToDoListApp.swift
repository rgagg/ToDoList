//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
  var body: some Scene {
    WindowGroup {
      ToDoListView()
        .modelContainer(for: ToDo.self)
    }
  }
  // On application start:
  // print path to local data for the simulator to the debug console
  init() {
    print(URL.applicationSupportDirectory.path(percentEncoded: false))
  }
}
