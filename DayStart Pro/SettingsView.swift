//
//  SettingsView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-06-03.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedTimeZone = TimeZone.current
    @State private var selectedRinger = "Default"

    let timeZones = TimeZone.knownTimeZoneIdentifiers
    let ringers = ["Default", "Chime", "Beep", "Alarm"]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Time Zone")) {
                    Picker("Select Time Zone", selection: $selectedTimeZone) {
                        ForEach(timeZones, id: \.self) { timeZoneID in
                            Text(timeZoneID).tag(TimeZone(identifier: timeZoneID))
                        }
                    }
                    .pickerStyle(WheelPickerStyle()) // Wheel picker for better scrolling
                    .frame(height: 200) // Limit the height for better scrolling experience
                }

                Section(header: Text("Ringer")) {
                    Picker("Select Ringer", selection: $selectedRinger) {
                        ForEach(ringers, id: \.self) { ringer in
                            Text(ringer)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // Menu picker for ringer selection
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button("Done") {
                // Action to dismiss the settings view
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
