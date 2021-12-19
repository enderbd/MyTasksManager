//
//  MyTasksView.swift
//  MyTasks
//
//  Created by Maczilla on 18.12.21.
//

import SwiftUI

struct MyTasksView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MyTask.title, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<MyTask>
    
    var body: some View {
        NavigationView{
            List {
                ForEach(tasks) { grabbedTask in
                    Text(grabbedTask.title!)
                }
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
}


struct MyTasksView_Previews: PreviewProvider {
    static var previews: some View {
        MyTasksView()
    }
}

