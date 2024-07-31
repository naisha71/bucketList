//
//  NewToDoView.swift
//  bucketList
//
//  Created by Scholar on 30/07/2024.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack{
            Text ("new activity title:")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 0.918, saturation: 0.975, brightness: 0.796))
            TextField("enter the task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color("ourPurple"))
                .cornerRadius (15)
                .padding()
            //DatePicker("pick a date", selection: .constant(.now))
            Toggle(isOn: $toDoItem.isImportant) {
                Text("is it important?")
                    .font(.body)
                    .foregroundColor(Color(hue: 0.956, saturation: 0.904, brightness: 0.387))
                    .padding()
            
                Button {
                    addToDo()
                    self.showNewTask = false
                }label:{
                    Text ("save")
                        .multilineTextAlignment(.center)
                }
                
            }
            .padding()
        }
    }
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
        
    }
}

//#Preview {
   //NewToDoView()
//}
