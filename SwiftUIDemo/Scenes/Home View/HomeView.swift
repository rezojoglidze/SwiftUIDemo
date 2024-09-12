//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI

// MARK: - Home View
struct HomeView: View {
    // MARK: Properties
    @StateObject private var viewModel: HomeViewModel
    
    // MARK: Properties - Navigation
    @State private var navigationPath = NavigationPath()
    
    // MARK: Initializers
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    @State private var isLongPressed = false
    @State private var growingAnimationText: String = ""
    
    // MARK: Body
    public var body: some View {
        ZStack(alignment: .center) {
            Color.pink.opacity(0.05).ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                headerText
                    .padding(.horizontal, 24)
                
                
                Spacer().frame(width: 200, height: 230)
                
                
                VStack {
                    Text("Tap and hold he logo to commit.")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.red.opacity(0.4))
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height: 5)
                }
                
                Spacer()
            }
            
            animationView
            
        }
    }
    
    private var headerText: some View { 
        VStack(spacing: 6) {
            Text("I will use AI Calorie Counter to")
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(Color.black.opacity(0.4))
                .multilineTextAlignment(.center)
            
            Text("log all my calories and consume 1785 calories per day")
                .font(.system(size: 20))
                .foregroundStyle(Color.black.opacity(0.7))
                .multilineTextAlignment(.center)
        }
    
    }
    private var animationView: some View {
        VStack {
            if isLongPressed {
                ZStack {
                    GrowingAnimation()
                    
                    Text(growingAnimationText)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16))
                }
            } else {
                Spacer().frame(height: 150)
                PulsingAnimation()
                    .onLongPressGesture(minimumDuration: 0.5, perform: {
                        isLongPressed = true
                        startTimer()
                    })
                
            }
        }
    }
    
    func startTimer() {
        var counter: Double = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            counter += 1
            
            if counter == 1 {
                growingAnimationText = "Hold on"
            } else if counter == 2 {
                growingAnimationText = "Just a bit more..."
            } else if counter == 3 {
                growingAnimationText = ""
            }
            
            if counter == 5 {
                timer.invalidate()
                isLongPressed = false
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        configurePreview()
        
        return HomeView()
    }
}
#endif
