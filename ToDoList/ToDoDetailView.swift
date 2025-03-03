//
//  ToDoDetailView.swift
//  ToDoList
//
//  Created by Richard Gagg on 3/3/2025.
//

import SwiftUI

struct ToDoDetailView: View {
  var passedValue: String
  
  @Environment(\.dismiss) private var dismiss
  
  var body: some View {
    VStack {
      Image(systemName: "swift")
        .resizable()
        .scaledToFit()
        .foregroundStyle(.orange)
      
      Text("You are a swifty legend!\nYou passed the value \(passedValue)")
        .font(.largeTitle)
        .multilineTextAlignment(.center)
      
      Spacer()
      /*
       Button {
         dismiss()
       } label: {
         Text("Get Back!")
       }
       .buttonStyle(.borderedProminent)
       */
    }
    .padding()
  }
}




#Preview {
  ToDoDetailView(passedValue: "1")
}
