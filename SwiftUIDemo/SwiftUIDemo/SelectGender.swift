//
//  SelectGender.swift
//  SwiftUIDemo
//
//  Created by Manoj Kumar on 21/11/19.
//  Copyright © 2019 Manoj kumar. All rights reserved.
//

import SwiftUI

struct SelectGender: View {
    @State private var isButtonSelfTaped = true
    @State private var isButtonLookingForTaped = false
    var body: some View {
        
        VStack(alignment: .leading){
            Text("I am a").bold().font(Font.system(size: 36))
            Button(action: {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 100.0)){
                    self.isButtonSelfTaped.toggle()
                    self.isButtonLookingForTaped.toggle()
                }
                
            }) {
                if isButtonSelfTaped{
                    Text("Man").font(Font.system(size: 32))
                    .frame(width: 137, height: 50)
                }else{
                   Text("Woman").font(Font.system(size: 32))
                    .frame(width: 186, height: 50)
                }
                }
               
                .background(Color.orange)
                .clipped()
                .cornerRadius(29)
            .foregroundColor(Color.white).padding(.top,22).buttonStyle(buttonTaped())
            
            Text("Looking for").bold().font(Font.system(size: 36)).padding(.top,22)
            Button(action: {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 100.0)){
                    self.isButtonSelfTaped.toggle()
                    self.isButtonLookingForTaped.toggle()
                }
//                withAnimation(.easeInOut(duration: 0.3)) {
//                    self.isButtonSelfTaped.toggle()
//                    self.isButtonLookingForTaped.toggle()
//                }
            }){
            if isButtonLookingForTaped{
                Text("Man").font(Font.system(size: 32))
                .frame(width: 137, height: 50)
            }else{
               Text("Woman").font(Font.system(size: 32))
                
                .frame(width: 186, height: 50)
            }
            }
            .background(Color.orange)
            .clipped()
            .cornerRadius(29)
                .foregroundColor(Color.white).padding(.top,22)
            
        }.position(x: 121, y: 220).padding(.leading).buttonStyle(buttonTaped())
    }
    

}

struct buttonTaped:ButtonStyle{
    //typealias Body = buttonTaped.Body
    
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        //.scaleEffect(configuration.isPressed ? 0.9 : 1.0)
        //.padding()
    }
}

fileprivate func btnSelfTaped(){
    
}

fileprivate func btnLookingForTaped(){
    
}


struct SelectGender_Previews: PreviewProvider {
    static var previews: some View {
        SelectGender()
    }
}
