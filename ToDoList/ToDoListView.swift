//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
  @Query var toDos: [ToDo]
  @State private var showAddItemSheet: Bool = false
  @State private var sortSelection: SortOption = .open
  @Environment(\.modelContext) var modelContext
  
  var body: some View {
    NavigationStack {
      ToDoSortedList(sortSelection: sortSelection)
        .navigationBarTitleDisplayMode(.automatic)
        .navigationTitle("To Do List")
        .sheet(isPresented: $showAddItemSheet, content: {
          NavigationStack {
            ToDoDetailView(toDo: ToDo())
          }
        })
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              showAddItemSheet.toggle()
            } label: {
              Image(systemName: "plus")
            }
          }
          
          ToolbarItem(placement: .bottomBar) {
            Picker("Sort Order", selection: $sortSelection) {
              //
              ForEach(SortOption.allCases, id: \.self) { order in
                Text(order.rawValue)
              }
            }
            .pickerStyle(SegmentedPickerStyle())
          }
        }
    }
    .font(.title2)
    .listStyle(.grouped)
  }
}


#Preview {
  ToDoListView()
    .modelContainer(ToDo.preview)
}
