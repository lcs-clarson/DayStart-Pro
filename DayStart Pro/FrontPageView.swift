//
//  FrontPageView.swift
//  DayStart Pro
//
//  Created by Charlie Larson on 2024-05-30.
//

import SwiftUI

struct FrontPageView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            MainView()
        } else {
            VStack {
                Spacer()
                Text("DayStartPro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    withAnimation {
                        self.isActive = true
                    }
                }) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct FrontPageView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView()
    }
}
