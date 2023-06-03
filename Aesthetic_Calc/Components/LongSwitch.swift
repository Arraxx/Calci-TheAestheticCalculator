//
//  LongSwitch.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 31/05/23.
//

import SwiftUI

struct LongSwitch: View {
    let content : String
    var action : () -> Void
    var body: some View{
        Button(action: {
            action()
        }){
            Text(content)
                .font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width:168, height: 75)
                .background(RoundedRectangle(cornerRadius: 30.5).fill(Color("SwitchColor")).shadow(radius: 10))
        }
    }
}

struct LongImageSwitch : View{
    let content : String
    var action : () -> Void
    var body: some View{
        Button(action: {
            action()
        }){
            Image(systemName:content)
                .font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width:168, height: 75)
                .background(RoundedRectangle(cornerRadius: 30.5).fill(Color("SwitchColor")).shadow(radius: 10))
        }
    }
}
