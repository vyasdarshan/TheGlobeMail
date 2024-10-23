//
//  ErrorView.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack {
            Text(Strings.errorTitle)
                .font(.largeTitle)
                .foregroundColor(.red)
            Text(message)
                .multilineTextAlignment(.center)
                .padding()
            Button(action: {
                retryAction()
            }) {
                Text(Strings.retryActionTitle)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ErrorView(message: "Something went wrong. Please try again.", retryAction: {
                print("Retry tapped")
            })
}
