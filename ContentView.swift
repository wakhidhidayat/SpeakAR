import SwiftUI

@available(iOS 16.0, *)
struct ContentView : View {
    @State private var modelName: String?
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    @State private var isNavigate = false
    @State private var isCorrect = false
    
    private let script = "Dear audience, I want to remind you that you are capable of achieving great things. Believe in yourself, work hard, and never give up on your dreams. Thank you."
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(modelName: $modelName).edgesIgnoringSafeArea(.all)
            
            Button {
                modelName = "real-people.usdz"
            } label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            .hidden(modelName != nil)
            
            VStack {
                Text("Say the script below: ")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.75))
                    .multilineTextAlignment(.center)
                    .padding()
                    .hidden(isRecording == false)
                
                Text(script)
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.75))
                    .multilineTextAlignment(.center)
                    .italic()
                    .padding()
                    .hidden(isRecording == false)
                
                Button {
                    if !isRecording {
                        speechRecognizer.transcribe()
                    } else {
                        speechRecognizer.stopTranscribing()
                        if speechRecognizer.transcript.lowercased() == script.lowercased().replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ".", with: "") {
                            isCorrect = true
                        } else {
                            isCorrect = false
                        }
                        isNavigate = true
                    }
                    isRecording.toggle()
                } label: {
                    Image(systemName: "mic")
                        .font(.title)
                        .foregroundColor(isRecording ? .white : .accentColor)
                        .padding()
                        .background(isRecording ? Color.accentColor : Color.white)
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                }
                .hidden(modelName == nil)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $isNavigate) {
            ResultView(isCorrect: isCorrect, speechTranscript: speechRecognizer.transcript, script: script)
        }
        .preferredColorScheme(.dark)
    }
}

#if DEBUG
@available(iOS 16.0, *)
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

