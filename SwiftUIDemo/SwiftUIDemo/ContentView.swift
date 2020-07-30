//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Manoj Kumar on 20/11/19.
//  Copyright © 2019 Manoj kumar. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var btnFaceBookTaped = false
    var body: some View {
        NavigationView{
            
            ZStack{
                Image("original")
                VStack{
                    logo().padding()
                    Text("More").font(Font.system(size: 40))
                        .multilineTextAlignment(.center).padding(.top,118)
                    Text("Than Dating").font(Font.system(size: 40))
                    Text("Find the one to walk the path").font(Font.system(size: 17)).padding(.top,7)
                    
                    Button(action: {
                        self.btnFaceBookTaped = true
                    })
                    {
                        NavigationLink(destination: SelectGender()) {
                           Text("Sign in With Facebook").frame(width: 220, height: 50)
                        }.navigationBarHidden(true)
                        
                        
                    }.foregroundColor(.white).background(Color.blue).padding(.top,100)

                        
        
                    Button(action: instagramTaped) {
                        Text("Sign in With Instagram").frame(width: 220, height: 50)
                        
                    }.foregroundColor(.white).background(LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing))
                        .padding(.top,15)
                        .padding(.leading,15)
                        .cornerRadius(20,antialiased: false)
                    Text("Terms of Service ")
                        .underline()
                        .bold()
                        .font(Font.system(size: 13))
                        .padding(.top,28)
                    Text("We will never publish anything on your timeline")
                    .font(Font.system(size: 15))
                    .padding(.top,10)
                    
                }.padding(.top,0)
            }
        }

        
    }
        
}

fileprivate func btnFaceBookTaped(){
   
}

fileprivate func instagramTaped(){
    
}

struct logo: View {
    var body: some View {
        Image("turtlerock").resizable().frame(width: 100, height: 100).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2)).shadow(radius: 10)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func ColorFromRGB(red:Double,green:Double,blue:Double) -> Color {
    return Color(
        red: Double(red) / 255.0,
        green: Double(green) / 255.0,
        blue: Double(blue) / 255.0
    )
}

struct GradientColor {
    /* Put all your colors here */

    /* And your gradients! */
    static let instagramGradient = Gradient(colors: [
        ColorFromRGB(red: 242, green: 155, blue: 68),
        ColorFromRGB(red: 152, green: 167, blue: 155),
        ColorFromRGB(red: 126, green: 74, blue: 175)
    ])
    static let facebookGradient = Gradient(colors: [
          ColorFromRGB(red: 75, green: 101, blue: 205),
          ColorFromRGB(red: 62, green: 82, blue: 162),
      ])
}
