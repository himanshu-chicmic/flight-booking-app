//
//  ContentView.swift
//  FlightBooking
//
//  Created by Himanshu on 4/14/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: @State properties for animations
    @State var framePositionTopPadding: CGFloat = -58
    @State var planePositionX: CGFloat = -90
    @State var textScale: CGFloat = 0
    @State var buttonHeight: CGFloat = 0
    
    // MARK: - view body start
    var body: some View {
        VStack {
            
            // MARK: - airplane image clipped left background
            ZStack{
                // background rounded rectangle
                Rectangle()
                    .frame(width: 246)
                    .foregroundColor(.white.opacity(0))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#89C9FF")!, Color.init(hex: "#D1CDFF")!]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(200)
                
                // airplane image
                Image("airplane")
                    .resizable()
                    .frame(width: 380, height: 300)
                    .rotationEffect(Angle(degrees: 10))
                    .shadow(color: .white, radius: 74)
                    .position(x: planePositionX, y: 218)
                    .animation(
                        .easeInOut(duration: 0.3).delay(0.6), value: planePositionX
                    )
                
                // clipping image using rectangles
                HStack (spacing: 0){
                    Rectangle()
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .frame(width: 246)
                        .foregroundColor(.white.opacity(0))
                    
                    Rectangle()
                        .foregroundColor(.white.opacity(0))
                }
            }
            .frame(height: 436)
            .padding(.top, framePositionTopPadding)
            .animation(.easeIn(duration: 0.25).delay(0.25), value: framePositionTopPadding)
            
            // MARK: - introductory text views
            Group{
                
                Text("Find your flight")
                    .font(.custom("Poppins-SemiBold", size: 24))
                    .foregroundColor(Color.init(hex: "#282828"))
                    .padding(.bottom, 12)
                    .padding(.top, 34)
                
                Text("The application will help you find the best flight tickets to various destinatins in just an app!")
                    .multilineTextAlignment(.center)
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color.init(hex: "#8F8F8F"))
                    .padding(.bottom, 24)
                    
            }
            .opacity(textScale)
            .animation(.easeIn(duration: 0.3).delay(0.9), value: textScale)
            .frame(width: 246)
            
            // MARK: - get started button
            Button(action: {
                // TODO: go to next screen
            }, label: {
                Text("Get Started →")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Medium", size: 18))
            })
            .padding()
            .frame(width: 246, height: buttonHeight)
            .background(Color.init(hex: "#2E79F6"))
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
            .animation(.easeInOut(duration: 0.4).delay(1.2), value: buttonHeight)
        }
        .onAppear{
            framePositionTopPadding = 24
            planePositionX = 198
            textScale = 1
            buttonHeight = 54
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
