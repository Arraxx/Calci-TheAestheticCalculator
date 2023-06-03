//
//  ContentView.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 29/05/23.
//

import SwiftUI

struct MainView: View {
    @State var score: String = ""
    @State var completeString : String = ""
    var body: some View {
        ZStack{
            // Background Color setup
            Color(red : 203/255, green: 195/255, blue: 227/255).ignoresSafeArea()
            VStack{
                Text("Your Calci 👾").font(.title).shadow(radius: 10).padding(.top, 15)
                // To display all the operations and each keypress values.
                DisplayView(value: $score).shadow(radius: 5).padding(.top, 20)
                Spacer().frame(height: 50)
                // All process and content attached inside
                // Operations is in @OperationsForButtons file.
                ContentView(completeString: $completeString, finalscore : $score)
            }
            
        }
        
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
