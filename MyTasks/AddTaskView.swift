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
    @FocusState var titleFocus: Bool
    
    var body: some View {
        VStack {
            Spacer()
            TextField("New Task", text: $taskTitle )
                .font(.largeTitle)
                .focused($titleFocus)
                .submitLabel(.go)
                .padding()
                .onSubmit {
                    addTask()
                }
            Button(action: addTask) {
                Text("Add task to list")
            }
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                titleFocus = true
            }
        }
    }
    
    func addTask() {
        if (taskTitle.count > 0) {
            let newTask = MyTask(context: viewContext)
            newTask.title = taskTitle
            if (taskTitle.count > 20 ) {
                newTask.isTooLong = true
            } else {
                newTask.isTooLong = false
            }
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

