//
//  ContentView.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 29/05/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var completeString : String
    @Binding var finalscore : String
    var body: some View {
        VStack{
            HStack{
                Spacer()
                LongImageSwitch(content: "delete.backward", action :{deleteEachVal()}).shadow(radius: 5)
                Spacer()
                Switches(content: "AC", action: { removeAll() }).shadow(radius: 5)
                Spacer()
                Switches(content: "/",  action: { buttonTapped(content: "/") }).shadow(radius: 5)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Switches(content: "1",  action: { buttonTapped(content: "1") }).shadow(radius: 5)
                Spacer()
                Switches(content: "2",  action: { buttonTapped(content: "2") }).shadow(radius: 5)
                Spacer()
                Switches(content: "3",  action: { buttonTapped(content: "3") }).shadow(radius: 5)
                Spacer()
                Switches(content: "+",  action: { buttonTapped(content: "+") }).shadow(radius: 5)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Switches(content: "4",  action: { buttonTapped(content: "4") }).shadow(radius: 5)
                Spacer()
                Switches(content: "5",  action: { buttonTapped(content: "5") }).shadow(radius: 5)
                Spacer()
                Switches(content: "6",  action: { buttonTapped(content: "6") }).shadow(radius: 5)
                Spacer()
                Switches(content: "-",  action: { buttonTapped(content: "-") }).shadow(radius: 5)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Switches(content: "7",  action: { buttonTapped(content: "7") }).shadow(radius: 5)
                Spacer()
                Switches(content: "8",  action: { buttonTapped(content: "8") }).shadow(radius: 5)
                Spacer()
                Switches(content: "9",  action: { buttonTapped(content: "9") }).shadow(radius: 5)
                Spacer()
                Switches(content: "X",  action: { buttonTapped(content: "*") }).shadow(radius: 5)
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                LongSwitch(content: "0", action: { buttonTapped(content: "0") }).shadow(radius: 5)
                Spacer()
                Switches(content: ".",  action: { buttonTapped(content: ".") }).shadow(radius: 5)
                Spacer()
                Switches(content: "=",  action: { outputButtonTapped() }).shadow(radius: 5)
                Spacer()
            }
            
        }
    }
    
    func buttonTapped(content: String) {
        completeString += content
        if(completeString.count>18){
            finalscore = "Cant have this much values"
        }
        else{
            finalscore = completeString
        }
    }
    
    func outputButtonTapped(){
        finalscore = ""
        let objectOperations = operations()
        let fetchFinalScore = objectOperations.finalScores(combinedString: completeString)
        completeString = fetchFinalScore
        finalscore += fetchFinalScore
    }
    
    func removeAll(){
        completeString = ""
        finalscore = completeString
    }
    
    // TODO: Not showing the same values (completeString) after = and then backspace.
    func deleteEachVal(){
        completeString = String(completeString.dropLast())
        finalscore = completeString
    }
}
