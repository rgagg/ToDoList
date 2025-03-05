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
  @Environment(\.modelContext) var modelContext
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(toDos) { toDo in
          NavigationLink {
            ToDoDetailView(toDo: toDo)
          } label: {
            Text(toDo.item)
          }
          .font(.title2)
        }
      }
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
      }
    }
    .font(.title2)
    .listStyle(.grouped)
  }
}


#Preview {
  ToDoListView()
    .modelContainer(for: ToDo.self, inMemory: true)
}
