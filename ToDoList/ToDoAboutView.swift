//
//  ToDoAboutView.swift
//  ToDoList
//
//  Created by Richard Gagg on 7/3/2025.
//

import SwiftUI

struct ToDoAboutView: View {
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    
    Text("About To Do List")
      .font(.largeTitle)
      .foregroundStyle(.indigo)
      .padding(.top)
    
    List {
      Text("This application was written and coded by Richard Gagg. This application was created as part of Professor Gallauger's SwiftUI course from Boston College.")
      
      Text("Artwork used in this application has been provided for free use within this application by Prof. G.")
      
      Text("The application is intended for personal use only and not for any commercial use.")
      
      Text("As this application is the work of Richard Gagg, the application is likly to be in a constant state of continuous development and improvement.")
    }
    .font(.title3)
    .navigationBarBackButtonHidden()
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "house")
        }
      }
    }
  }
}


  #Preview {
    ToDoAboutView()
  }
