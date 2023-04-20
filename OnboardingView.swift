//
//  OnboardingView.swift
//  SpeakAR
//
//  Created by Wahid Hidayat on 18/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct OnboardingView: View {
    @State private var currentTab = 0
    @State private var isNavigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentTab) {
                    OnboardingItem(model: OnboardingModel(imageName: "first_item", text: "Point yellow indicator to the ground until the yellow indicator turn out into full square like image above, then place the object using checklist button"))
                        .tag(0)
                    
                    OnboardingItem(model: OnboardingModel(imageName: "second_item", text: "Tap mic button to start speech"))
                        .tag(1)
                    
                    OnboardingItem(model: OnboardingModel(imageName: "third_item", text: "Done speech? Tap mic button again to show your result"))
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                Button {
                    isNavigate = true
                } label: {
                    Text("Skip")
                        .padding(8)
                        .font(.system(size: 24, weight: .bold))
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationDestination(isPresented: $isNavigate) {
                ContentView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct OnboardingItem: View {
    let model: OnboardingModel
    
    var body: some View {
        VStack {
            Image(model.imageName)
                .resizable()
                .frame(width: 500, height: 500)
                .padding()
            
            Text(model.text)
                .font(.system(size: 32, weight: .medium))
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct OnboardingModel {
    let imageName: String
    let text: String
}

@available(iOS 16.0, *)
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
