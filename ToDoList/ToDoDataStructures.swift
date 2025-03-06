//
//  ToDoDataStructures.swift
//  ToDoList
//
//  Created by Richard Gagg on 5/3/2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
  var item: String = ""
  var reminderIsOn: Bool = false
  var dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
  var notes: String = ""
  var isCompleted: Bool = false
  
  init(item: String = "",
       reminderIsOn: Bool = false,
       dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
       notes: String = "",
       isCompleted: Bool = false) {
    self.item = item
    self.reminderIsOn = reminderIsOn
    self.dueDate = dueDate
    self.notes = notes
    self.isCompleted = isCompleted
  }
}


extension ToDo {
  
  // Mock Data
  static var preview: ModelContainer {
    
    let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    // Add mock data
    container.mainContext.insert(ToDo(item: "Learn SwiftUI", reminderIsOn: false, dueDate: Date(), notes: "", isCompleted: false))
    container.mainContext.insert(ToDo(item: "Learn Swiftdata", reminderIsOn: true, dueDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!, notes: "", isCompleted: false))
    container.mainContext.insert(ToDo(item: "Take Vacation", reminderIsOn: true, dueDate: Calendar.current.date(byAdding: .day, value: 30, to: Date())!, notes: "time for a break", isCompleted: false))
    container.mainContext.insert(ToDo(item: "Make Diner", reminderIsOn: false, dueDate: Date(), notes: "", isCompleted: true))

    return container
  }
}
