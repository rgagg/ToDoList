//
//  ToDoDetailView.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI
import SwiftData

struct ToDoDetailView: View {
  @State var toDo: ToDo
  
  @State private var item: String = ""
  @State private var reminderIsOn: Bool = false
  @State private var dueDate: Date = Calendar.current.date(byAdding: .day,
                                                           value: 1,
                                                           to: Date())!
  @State private var notes: String = ""
  @State private var isCompleted: Bool = false
  
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) var modelContext
  
  var body: some View {
    List {
      TextField("Enter To Do Here", text: $item)
        .font(.title)
        .textFieldStyle(.roundedBorder)
        .overlay {
          RoundedRectangle(cornerRadius: 12)
            .stroke(style: StrokeStyle(lineWidth: 1))
        }
        .listRowSeparator(.hidden)
        .padding(.top)
      
      Section(header: Text("")) {
        Toggle("Set Reminder:", isOn: $reminderIsOn)
          .tint(.blue)
        
        DatePicker("Due Date",
                   selection: $dueDate,
                   displayedComponents: .date)
        .disabled(!reminderIsOn)
      }
      .listRowSeparator(.hidden)
      
      Section(header: Text("")) {
        Text("Notes:")
          .padding(.top)
        
        TextEditor(text: $notes)
          .textEditorStyle(.plain)
          .frame(minHeight: (32 * 3)) //Line height * number of lines.
          .fixedSize(horizontal: false, vertical: true)
          .overlay {
            RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2)
          }
      }
      .listRowSeparator(.hidden)
      
      Section(header: Text("")) {
        Toggle("Is Completed", isOn: $isCompleted)
          .tint(.green)
          .listRowSeparator(.hidden)
      }
      
    }
    .listStyle(.plain)
    .onAppear {
      item = toDo.item
      reminderIsOn = toDo.reminderIsOn
      dueDate = toDo.dueDate
      notes = toDo.notes
      isCompleted = toDo.isCompleted
    }
    .font(.title2)
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          dismiss()
        } label: {
          Text("Cancel")
        }
      }
      
      ToolbarItem(placement: .topBarTrailing) {
        Button {
          // Move data from local vars to toDo object
          toDo.item = item
          toDo.reminderIsOn = reminderIsOn
          toDo.dueDate = dueDate
          toDo.notes = notes
          toDo.isCompleted = isCompleted
          
          // Save data to DB
          modelContext.insert(toDo)
          
          // Push data to DB imediatly
          guard let _ = try? modelContext.save() else {
            print("🤬 ERROR: Failed to save data on ToDoDetailView.")
            return
          }
          
          dismiss()
        } label: {
          Text("Save")
        }
        
      }
    }
    .font(.title2)
  }
}




#Preview {
  NavigationStack {
    ToDoDetailView(toDo: ToDo())
      .modelContainer(for: ToDo.self, inMemory: true)
  }
}
