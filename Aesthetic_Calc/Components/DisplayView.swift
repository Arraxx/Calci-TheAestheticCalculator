//
//  DisplayView.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 29/05/23.
//

import SwiftUI

struct DisplayView: View {
    @Binding var value : String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
                        .fill(Color("SwitchColor").opacity(7))
                        .frame(height: 120)
                        
                        .padding()
                        .overlay(
                            TextField("0", text: $value).multilineTextAlignment(.trailing).font(.title)
                                .padding(.trailing, 30)
                        )
    }
}
