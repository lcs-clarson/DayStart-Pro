//
//  ContentView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-27.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [String] = []
    @State private var showAddReminder = false
    @State private var showAlarmSetting = false
    @State private var selectedTime = Date()
    @State private var alarms: [Date] = []
    @State private var quoteIndex = 0
    @State private var showSettings = false
    @State private var selectedTimeZone = TimeZone.current

    let quotes = [
        "The best way to get started is to quit talking and begin doing. - Walt Disney",
        "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty. - Winston Churchill",
        "Don’t let yesterday take up too much of today. - Will Rogers"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    List {
                        Section(header: Text("Reminders")) {
                            ForEach(reminders, id: \.self) { reminder in
                                HStack {
                                    Text(reminder)
                                    Spacer()
                                    Button(action: {
                                        reminders.removeAll { $0 == reminder }
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                        Section(header: Text("Alarms")) {
                            ForEach(alarms, id: \.self) { alarm in
                                HStack {
                                    Text(alarm, style: .time)
                                    Spacer()
                                    Button(action: {
                                        alarms.removeAll { $0 == alarm }
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                    }
                    .listStyle(.plain)

                    HStack {
                        Button(action: {
                            showAddReminder.toggle()
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.blue)
                                .padding()
                        }

                        Spacer()

                        Button(action: {
                            showAlarmSetting.toggle()
                        }) {
                            Text("Set Alarm")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }

                    Button(action: {
                        quoteIndex = (quoteIndex + 1) % quotes.count
                    }) {
                        Text("Show Another Quote")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                    .padding(.top, 20)

                    Text("Quote of the Day")
                        .font(.title)
                        .padding()

                    Text(quotes[quoteIndex])
                        .font(.body)
                        .padding()

                    Spacer()

                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView(selectedTimeZone: $selectedTimeZone)
                    }
                }
            }
            .navigationTitle("DayStartPro")
            .sheet(isPresented: $showAddReminder) {
                AddReminderView(reminders: $reminders)
            }
            .presentationDetents([.medium])
            .sheet(isPresented: $showAlarmSetting) {
                AlarmSettingView(selectedTime: $selectedTime, alarms: $alarms, selectedTimeZone: $selectedTimeZone)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

