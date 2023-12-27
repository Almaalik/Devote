//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Abdul Maalik on 16/09/23.
//

import SwiftUI

struct NewTaskItemView: View {
    //MARK: - PROPERTIES
    
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("isdarkMode") private var isDarkMode: Bool = false
    @State private var task: String = ""
    @Binding var isShowning: Bool
    @FocusState private var taskEdited: Bool
    private var isButtonDisables: Bool {
        task.isEmpty
    }
    
    //MARK: - FUNCTIONS
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.id = UUID()
            newItem.completion = false
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            //REST TEXT FIELD AND RESIGN KEYBOARD
            task = ""
            taskEdited = false
            isShowning = false
        }
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
               TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                    .focused($taskEdited)
                Button(action: {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.impactOccurred()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisables)
                .onTapGesture {
                    if isButtonDisables {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisables ? .blue : .pink)
                .cornerRadius(10)
            }//: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//: VSTACK
        .padding()
    }
}

//MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowning: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
