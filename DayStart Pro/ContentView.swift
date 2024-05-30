//
//  ContentView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-27.
//

import SwiftUI

struct MainView: View {
    @State private var reminders: [String] = []
    @State private var showAlarmSetting = false
    @State private var selectedTime = Date()

    var body: some View {
        NavigationView {
            VStack {
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

                Spacer()

                Button(action: {
                    // Add new reminder
                    reminders.append("New Reminder")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                Spacer()
            }
            .navigationTitle("DayStartPro")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $showAlarmSetting) {
                AlarmSettingView(selectedTime: $selectedTime)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
