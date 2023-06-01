//
//  Switches.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 29/05/23.
//

import SwiftUI

struct Switches: View {
    var content : String
    var action: () -> Void
    var body: some View{
        Button(action: {
            action()
        }){
            Text(content)
                .font(.title)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width:75, height: 75)
                .background(Circle().fill(Color("SwitchColor")).shadow(radius: 10))
        }
        
    }
}
