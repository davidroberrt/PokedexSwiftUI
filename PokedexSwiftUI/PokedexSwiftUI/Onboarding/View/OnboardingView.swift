//
//  ContentView.swift
//  PokedexSwiftUI
//
//  Created by David Robert on 13/08/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            trainersImages
            Spacer().frame(height: 45)
            titleAndDescriptions
            Spacer().frame(height: 24)
            onboardingProgressView
            Spacer().frame(height: 24)
            continueButton
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               maxHeight: .infinity,
               alignment: .bottom)
        .padding()
    }
    
    var trainersImages: some View{
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
    }
    var titleAndDescriptions: some View{
        VStack(spacing: 16) {
            Text("Todos os Pokémons em um só Lugar")
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            Text("Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo")
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
    var continueButton: some View {
        Button(action: {
            
        }, label: {
            Rectangle()
                .frame( height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("DarkBlue"))
                .overlay{
                    Text("Continuar")
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-SemiBold", size: 18)
                        )
                }
        })
    }
}
    

#Preview {
    OnboardingView()
}
