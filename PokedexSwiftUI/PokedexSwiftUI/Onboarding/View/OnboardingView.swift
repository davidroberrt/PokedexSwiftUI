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
        TabView(selection: $viewModel.currentStep) {
            ForEach(0..<viewModel.onboardingSteps.count, id: \.self) {
                Index in
                VStack {
                    trainersImages
                    Spacer().frame(height: 45)
                    titleAndDescriptions(title: viewModel.onboardingSteps[Index].title, description: viewModel.onboardingSteps[Index].description)
                    Spacer().frame(height: 24)
                    onboardingProgressView
                    Spacer().frame(height: 24)
                    continueButton(buttonText: viewModel.onboardingSteps[Index].buttonText)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       maxHeight: .infinity,
                       alignment: .bottom)
                .padding()
            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    @ViewBuilder
    var trainersImages: some View{
        if viewModel.currentStep == 0 {
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
    var onboardingProgressView: some View {
        HStack{
            Rectangle()
                .frame(width: 28, height: 9)
                .clipShape(.capsule)
                .foregroundStyle(Color("DarkBlue"))
            Circle()
                .frame(width: 9, height: 9)
                .foregroundStyle(Color(.lightGray))
        }
    }
    func continueButton(buttonText: String) -> some View {
        Button(action: {
            
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
