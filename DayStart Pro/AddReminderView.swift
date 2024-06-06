//
//  AddReminderView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-31.
//

import SwiftUI

struct AddReminderView: View {
    @Binding var reminders: [String]
    @State private var newReminder: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new reminder", text: $newReminder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    let trimmedReminder = newReminder.trimmingCharacters(in: .whitespacesAndNewlines)
                    if !trimmedReminder.isEmpty {
                        reminders.append(trimmedReminder)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add Reminder")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView(reminders: .constant([]))
    }
}
