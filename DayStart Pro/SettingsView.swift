//
//  SettingsView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-06-03.
//

import SwiftUI

struct SettingsView: View {
    @Binding var selectedTimeZone: TimeZone
    @State private var selectedRinger = "Default"
    @Environment(\.presentationMode) var presentationMode

    // Create a list of time zones with clean display names
    var timeZones: [String] {
        TimeZone.knownTimeZoneIdentifiers.map { timeZoneID in
            timeZoneID.split(separator: "/").last?.replacingOccurrences(of: "_", with: " ") ?? timeZoneID
        }.sorted()
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Time Zone")) {
                    Picker("Select Time Zone", selection: $selectedTimeZone) {
                        ForEach(TimeZone.knownTimeZoneIdentifiers, id: \.self) { timeZoneID in
                            Text(timeZoneID.split(separator: "/").last?.replacingOccurrences(of: "_", with: " ") ?? timeZoneID)
                                .tag(TimeZone(identifier: timeZoneID)!)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 200)
                }

                Section(header: Text("Ringer")) {
                    Picker("Select Ringer", selection: $selectedRinger) {
                        ForEach(["Default", "Chime", "Beep", "Alarm"], id: \.self) { ringer in
                            Text(ringer)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(selectedTimeZone: .constant(TimeZone.current))
    }
}
