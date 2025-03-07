//
//  ToDoSortedList.swift
//  ToDoList
//
//  Created by Richard Gagg on 7/3/2025.
//

import SwiftUI
import SwiftData

enum SortOption: String, CaseIterable {
  case open = "Open"
  case alphbetically = "A-Z"
  case chronological = "Date"
  case closed = "Closed"
}

struct ToDoSortedList: View {
  @Query var toDos: [ToDo]
  @Environment(\.modelContext) var modelContext
  let sortSelection: SortOption
  
  init(sortSelection: SortOption) {
    self.sortSelection = sortSelection
    
    switch self.sortSelection {
    case .open:
      _toDos = Query(filter: #Predicate {$0.isCompleted == false})
    case .alphbetically:
      _toDos = Query(filter: #Predicate {$0.isCompleted == false}, sort: \.item)
    case .chronological:
      _toDos = Query(filter: #Predicate {$0.isCompleted == false}, sort: \.dueDate)
    case .closed:
      _toDos = Query(filter: #Predicate {$0.isCompleted == true})
    }
  }
  
  var body: some View {
    List {
      ForEach(toDos) { toDo in
        VStack(alignment: .leading) {
          HStack {
            Image(systemName: toDo.isCompleted ? "checkmark.circle" : "minus.circle")
              .foregroundStyle(toDo.isCompleted ? .green : .blue)
              .fontWeight(.bold)
              .onTapGesture {
                toDo.isCompleted.toggle()
                guard let _ = try? modelContext.save() else {
                  print("🤬 ERROR: Failed to save after toggle on ToDoListView.")
                  return
                }
              }
            
            NavigationLink {
              ToDoDetailView(toDo: toDo)
            } label: {
              VStack(alignment: .leading) {
                Text(toDo.item)
                if toDo.reminderIsOn {
                  HStack() {
                    Text(toDo.dueDate.formatted(date: .abbreviated, time: .omitted))
                      .foregroundStyle(.secondary)
                    Image(systemName: "calendar.badge.clock")
                      .symbolRenderingMode(.multicolor)
                  }
                  .font(.callout)
                }
              }
              .swipeActions(edge: .trailing) {
                Button("Delete", role: .destructive) {
                  modelContext.delete(toDo)
                  // Push data to DB imediatly
                  guard let _ = try? modelContext.save() else {
                    print("🤬 ERROR: Failed to save after delete on ToDoListView.")
                    return
                  }
                }
              }
            }
            .font(.title2)
          }
        }
      }
    }
  }
}


#Preview {
  ToDoSortedList(sortSelection: .alphbetically)
}
