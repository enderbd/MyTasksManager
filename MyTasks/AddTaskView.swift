//
//  AddTaskView.swift
//  MyTasks
//
//  Created by Maczilla on 18.12.21.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var taskTitle = ""
    var body: some View {
        VStack {
            TextField("New Task", text: $taskTitle )
            Button(action: {
                let newTask = MyTask(context: viewContext)
                newTask.title = taskTitle
                
                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }

            }) {
                        Text("Add task to list")
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
  
