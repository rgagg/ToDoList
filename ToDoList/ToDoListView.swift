//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI

struct ToDoListView: View {
  @State private var showAddItemSheet: Bool = false
  
  var toDos: [String] = [
    "Learn Swift",
    "Build Apps",
    "Change the world",
    "Bring the awesome"
  ]
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(toDos, id: \.self) { toDo in
          NavigationLink {
            ToDoDetailView(toDo: toDo)
          } label: {
            Text(toDo)
          }
          .font(.title2)
        }
        
      }
      .navigationBarTitleDisplayMode(.automatic)
      .navigationTitle("To Do List")
      .sheet(isPresented: $showAddItemSheet, content: {
        NavigationStack {
          ToDoDetailView(toDo: "")
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
}
