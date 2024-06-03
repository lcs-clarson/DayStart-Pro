//
//  AlarmSettingView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-30.
//

import SwiftUI

struct AlarmSettingView: View {
    @Binding var selectedTime: Date
    @Binding var alarms: [Date]
    @Binding var selectedTimeZone: TimeZone

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .environment(\.timeZone, selectedTimeZone)

                Button(action: {
                    alarms.append(selectedTime)
                }) {
                    Text("Add Alarm")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Set Alarm")
            .navigationBarItems(trailing: Button("Done") {
                // Action to dismiss the alarm setting view
            })
        }
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView(selectedTime: .constant(Date()), alarms: .constant([]), selectedTimeZone: .constant(TimeZone.current))
    }
}
