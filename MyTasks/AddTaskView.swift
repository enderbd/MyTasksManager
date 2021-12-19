//
//  AddTaskView.swift
//  MyTasks
//
//  Created by Maczilla on 18.12.21.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @State var taskTitle = ""
    var body: some View {
        VStack {
            TextField("New Task", text: $taskTitle )
                .submitLabel(.go)
                .onSubmit {
                    addTask()
                }
            Button(action: addTask) {
                        Text("Add task to list")
            } 
        }
    }
    
    func addTask() {
        let newTask = MyTask(context: viewContext)
        newTask.title = taskTitle
        if (taskTitle.count > 20 ) {
            newTask.isTooLong = true
        } else {
            newTask.isTooLong = false
        }
        
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
  
