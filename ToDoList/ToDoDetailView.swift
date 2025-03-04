//
//  ToDoDetailView.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI

struct ToDoDetailView: View {
  @State var toDo: String
  @State private var reminderIsOn: Bool = false
  @State private var dueDate: Date = Calendar.current.date(byAdding: .day,
                                                           value: 1,
                                                           to: Date())!
  @State private var notes: String = ""
  @State private var isCompleted: Bool = false
  
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    List {
      TextField("Enter To Do Here", text: $toDo)
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
          //
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
    ToDoDetailView(toDo: "Item")
  }
}
