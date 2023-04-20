//
//  ResultView.swift
//  SpeakAR
//
//  Created by Wahid Hidayat on 18/04/23.
//

import SwiftUI

struct ResultView: View {
    let isCorrect: Bool
    let speechTranscript: String
    let script: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text(isCorrect ? "🥳" : "💪🏻")
                .font(.system(size: 120))
            Text(isCorrect ? "Congrats you are correct" : "You almost correct. Don't give up")
                .font(.system(size: 56, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("What you just said: ")
                .font(.system(size: 40, weight: .bold))
            
            Text(speechTranscript)
                .font(.system(size: 32, weight: .medium))
                .italic()
            
            Text("What you should say: ")
                .font(.system(size: 40, weight: .bold))
            
            Text(script)
                .font(.system(size: 32, weight: .medium))
                .italic()
            Spacer()
            Spacer()
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isCorrect: true, speechTranscript: "Lorem ipsum dolor sir amet", script: "")
    }
}
