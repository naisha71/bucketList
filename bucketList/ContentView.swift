//
//  ContentView.swift
//  bucketList
//
//  Created by Scholar on 30/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    
    @State private var tick1 = "checkmark"
    @State private var tick2 = "pinkCheckmark"
    
    @State private var count = 0
    
    @Query var toDos: [ToDoItem]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color("ourPink"), Color("ourOrange") , Color("ourPurple")]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 10, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    HStack{
                        Text ("bucket list:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.918, saturation: 0.975, brightness: 0.796))
                        Spacer()
                        Button{
                            withAnimation{
                                self.showNewTask = true
                            }
                        }label: {
                            Text("+")
                                .font(.largeTitle)
                                .foregroundColor(Color(hue: 0.918, saturation: 0.975, brightness: 0.796))
                            
                        }
                    }
                    .padding()
                }
                
                List {
                    ForEach (toDos) {toDoItem in
                        HStack{
                            if toDoItem.isImportant == true {
                                VStack{
                                    HStack{
                                        Text(toDoItem.title)
                                            .font(.title3)
                                            .fontWeight(.medium)
                                            .foregroundColor(Color(hue: 0.956, saturation: 0.904, brightness: 0.387))
                                        Spacer()
                                        Text("‼️")
                                        //Text("\(toDoItem.timestamp, format:Data.FormatStyle(data:.numeric)"))
                                    }
                                }
                                
                            } else {
                                VStack{
                                    Text (toDoItem.title)
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(hue: 0.956, saturation: 0.904, brightness: 0.387))
                                    //Text("\(toDoItem.timestamp, format:Data.FormatStyle(data:.numeric)"))
                                }
                            }
                            
                            Spacer()
                            Button {
                                self.count += 1
                                if count%2 == 0 {
                                    tick1 = "checkmark"
                                } else {
                                    tick1 = "pinkCheckmark"
                                }
                            }label: {
                                Image(tick1)
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35.0, height: 35.0)
                            }

                        }
                        
                    }
                    .onDelete(perform: deleteToDo)
                    
                }
                .listStyle(.plain)
                if showNewTask {
                    NewToDoView(showNewTask:$showNewTask, toDoItem: ToDoItem(title:"",isImportant:false))
                }
            }
        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
