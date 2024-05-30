//
//  ContentView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-27.
//

import SwiftUI

struct MainView: View {
    @State private var currentTime = Date()

    var body: some View {
        VStack {
            Text("\(currentTime, formatter: DateFormatter.shortTime)")
                .font(.largeTitle)
                .padding()
                .onAppear(perform: updateTime)
        }
    }

    func updateTime() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.currentTime = Date()
        }
        RunLoop.current.add(timer, forMode: .common)
    }
}

extension DateFormatter {
    static var shortTime: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
