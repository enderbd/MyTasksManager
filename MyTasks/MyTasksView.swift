//
//  MyTasksView.swift
//  MyTasks
//
//  Created by Maczilla on 18.12.21.
//

import SwiftUI

struct MyTasksView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var taskLineLimit = 1
    @State var changeLineLimit = true
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MyTask.title, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<MyTask>
    
    var body: some View {
        NavigationView{
            List {
                ForEach(tasks) { grabbedTask in
                    //TODO: expand only the current item
                    if (grabbedTask.isTooLong) {
                        Text(grabbedTask.title!)
                            .lineLimit(taskLineLimit)
                            .onTapGesture(perform: toggleLineLimit)
                    } else {
                        Text(grabbedTask.title!)
                            .lineLimit(taskLineLimit)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("My Tasks")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddTaskView()) {
                        Label("Add Item", systemImage: "plus.circle.fill")
                    }
                }
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
    
    private func toggleLineLimit() {
        if changeLineLimit {
            taskLineLimit = 2
            changeLineLimit = false
        } else {
            taskLineLimit = 1
            changeLineLimit = true
        }
    }
}


struct MyTasksView_Previews: PreviewProvider {
    static var previews: some View {
        MyTasksView()
    }
}

