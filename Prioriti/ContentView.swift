//
//  ContentView.swift
//  Prioriti
//
//  Created by Dallin Bland on 1/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Task input field
                HStack {
                    Image(systemName: "checkmark.square")
                        .foregroundColor(.gray)
                    TextField("Task name", text: $newTaskName)
                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemBackground))
                        .shadow(radius: 2)
                )
                .padding(.horizontal)
                
                // Task list
                List {
                    ForEach(tasks) { task in
                        Text(task.name)
                    }
                    .onDelete(perform: deleteTasks)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks")
        }
    }
    
    private func addTask() {
        guard !newTaskName.isEmpty else { return }
        tasks.append(Task(name: newTaskName))
        newTaskName = ""
    }
    
    private func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
