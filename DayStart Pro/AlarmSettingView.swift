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
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()

            Button(action: {
                alarms.append(selectedTime)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Set Alarm")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Set Alarm")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView(selectedTime: .constant(Date()), alarms: .constant([]))
    }
}
