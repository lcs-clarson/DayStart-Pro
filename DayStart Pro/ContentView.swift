//
//  ContentView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-27.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [String] = []
    @State private var newReminder: String = ""
    @State private var showAlarmPicker = false
    @State private var selectedTime = Date()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new reminder", text: $newReminder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        if !newReminder.isEmpty {
                            reminders.append(newReminder)
                            newReminder = ""
                        }
                    }) {
                        Text("Add")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding()

                List(reminders, id: \.self) { reminder in
                    Text(reminder)
                }

                Button(action: {
                    showAlarmPicker.toggle()
                }) {
                    Text("Set Alarm")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showAlarmPicker) {
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                }

                Spacer()

                Text("Quote of the Day")
                    .font(.title)
                    .padding()

                Text(getQuoteOfTheDay())
                    .font(.body)
                    .padding()

                Spacer()
            }
            .navigationTitle("DayStartPro")
        }
    }

    func getQuoteOfTheDay() -> String {
        // Sample quotes
        let quotes = [
            "The best way to get started is to quit talking and begin doing. - Walt Disney",
            "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty. - Winston Churchill",
            "Don’t let yesterday take up too much of today. - Will Rogers"
        ]
        let index = Calendar.current.component(.day, from: Date()) % quotes.count
        return quotes[index]
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
