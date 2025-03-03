//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI

struct ToDoListView: View {
  
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
            ToDoDetailView(passedValue: toDo)
          } label: {
            Text(toDo)
          }
        }
        
      }
      .navigationBarTitleDisplayMode(.automatic)
      .navigationTitle("To Do List")
      .listStyle(.grouped)
      
    }
  }
}

#Preview {
  ToDoListView()
}
