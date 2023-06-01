//
//  OperationsForButtons.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 30/05/23.
//

import Foundation

class operations : ObservableObject{
    var s : String = ""
    
    
    // TODO: Add functionality for decimal values and more than one operations
    
    func finalScores(combinedString : String)->String{
        let finalVal : String = convertStringToVal(combinedString: combinedString)
        if(combinedString.count > 18 || finalVal.count > 18){
            return "Out of Bound :("
        }
        return finalVal
    }
    
    func convertStringToVal(combinedString: String)->String{
        if(combinedString.prefix(1) == "+" || combinedString.prefix(1) == "/" || combinedString.prefix(1) == "*"){
            return "NA"
        }
        var checkForNotMoreThanTwoOperations : Int = 0
        for char in combinedString{
            if(char == "+" || char == "-" || char == "/" || char == "*"){
                checkForNotMoreThanTwoOperations += 1
            }
        }
        if(checkForNotMoreThanTwoOperations > 1){
            return "for one operation"
        }
        else{
            var count : Int = 0
            for char in combinedString{
                if(char == "+"){
                    count+=1
                    let first : Int = Int(combinedString.prefix(count-1)) ?? 0
                    let second : Int = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    return String(addition(first: first, second: second))
                }
                if(char == "-"){
                    count+=1
                    let first : Int = Int(combinedString.prefix(count-1)) ?? 0
                    let second : Int = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    return String(subtraction(first: first, second: second))
                }
                if(char == "*"){
                    count+=1
                    let first : Int = Int(combinedString.prefix(count-1)) ?? 0
                    let second : Int = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    return String(multiplication(first: first, second: second))
                }
                if(char == "/"){
                    count+=1
                    let first : Int = Int(combinedString.prefix(count-1)) ?? 0
                    let second : Int = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    return String(division(first: first, second: second))
                }
                count+=1
            }
        }
        return "wrong output"
    }
    
    func addition(first : Int, second : Int) -> Int{
        return first+second
    }
    
    func subtraction(first : Int, second : Int) -> Int{
        return first-second
    }
    
    func multiplication(first : Int, second : Int) -> Int{
        return first*second
    }
    
    func division(first : Int, second : Int) -> Float{
        return Float(first)/Float(second)
    }
    
}
