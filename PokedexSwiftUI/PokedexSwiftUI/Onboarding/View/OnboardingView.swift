//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by David Robert on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel : OnboardingViewModel
    var body: some View {
        ZStack {
            if viewModel.showSplash {
                SplashView()
            } else {
                TabView(selection: $viewModel.currentStep) {
                    ForEach(Array(viewModel.onboardingSteps.enumerated()), id: \.offset) {
                        index, step in
                        VStack {
                            trainersImages(stepIndex: index)
                            Spacer().frame(height: 45)
                            titleAndDescriptions(title: step.title, description: step.description)
                            Spacer().frame(height: 24)
                            onboardingProgressView
                            Spacer().frame(height: 24)
                            continueButton(buttonText: step.buttonText)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                               maxHeight: .infinity,
                               alignment: .bottom)
                        .padding()
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.showSplash = false
            }
        }
    }
    @ViewBuilder
    func trainersImages(stepIndex: Int) -> some View {
        if stepIndex == 0 {
            ZStack{
                Image("trainer1")
                    .offset(x: -50)
                    .background{
                        Image("shadowTrainer1")
                            .offset(x: -65, y:110)
                    }
                Image("trainer2")
                    .offset(x: 50, y: -10)
                    .background{
                        Image("shadowTrainer1")
                            .offset(x: 60, y:110)
                    }
            }
        } else{
            Image("trainer3")
                .offset(y: 10)
                .background{
                    Image("shadowTrainer3")
                        .offset(x: -15,y:126)
                }
        }

    }
    func titleAndDescriptions(title:String, description: String) -> some View{
        VStack(spacing: 16) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            Text(description)
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    @ViewBuilder
    var onboardingProgressView: some View {
        if viewModel.currentStep == 0{
            HStack{
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
            }
        }else{
            HStack{
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("DarkBlue"))
            }
        }
    }
    func continueButton(buttonText: String) -> some View {
        Button(action: {
            viewModel.currentStep = 1
        }, label: {
            Rectangle()
                .frame( height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("DarkBlue"))
                .overlay{
                    Text(buttonText)
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-SemiBold", size: 18)
                        )
                }
        })
    }
}
    

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
