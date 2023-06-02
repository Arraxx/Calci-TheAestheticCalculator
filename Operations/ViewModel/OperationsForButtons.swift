//
//  OperationsForButtons.swift
//  Aesthetic_Calc
//
//  Created by Arrax on 30/05/23.
//

import Foundation

class operations : ObservableObject{
    var s : String = ""
    
    
    // TODO: Add functionality for more than one operations
    
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
            var first : Int = 0
            var second : Int = 0
            var count : Int = 0
            var isDecimal : Bool = false
            
            for char in combinedString{
                if(char == "+"){
                    count+=1
                    
                    first = Int(combinedString.prefix(count-1)) ?? 0
                    second = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    
                    isDecimal = checkForDecimalVal(combinedString : combinedString, count : count)
                    
                    if(isDecimal){
                        return String(addition(first: Float(combinedString.prefix(count-1)) ?? 0.0, second: Float(combinedString.suffix(combinedString.count - count)) ?? 0.0))
                    }
                    else{
                        return String(addition(first: first, second: second))
                    }
                }
                if(char == "-"){
                    count+=1
                    first = Int(combinedString.prefix(count-1)) ?? 0
                    second = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    
                    isDecimal = checkForDecimalVal(combinedString : combinedString, count : count)
                    
                    if(isDecimal){
                        return String(subtraction(first: Float(combinedString.prefix(count-1)) ?? 0.0, second: Float(combinedString.suffix(combinedString.count - count)) ?? 0.0))
                    }
                    else{
                        return String(subtraction(first: first, second: second))
                    }
                }
                if(char == "*"){
                    count+=1
                    first = Int(combinedString.prefix(count-1)) ?? 0
                    second = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    
                    isDecimal = checkForDecimalVal(combinedString : combinedString, count : count)
                    if(isDecimal){
                        return String(multiplication(first: Float(combinedString.prefix(count-1)) ?? 0.0, second: Float(combinedString.suffix(combinedString.count - count)) ?? 0.0))
                    }
                    else{
                        return String(multiplication(first: first, second: second))
                    }
                }
                if(char == "/"){
                    count+=1
                    first = Int(combinedString.prefix(count-1)) ?? 0
                    second = Int(combinedString.suffix(combinedString.count - count)) ?? 0
                    return String(division(first: first, second: second))
                }
                count+=1
            }
        }
        return "wrong output"
    }
    
    func addition<type : Numeric>(first : type, second : type) -> type{
        return first+second
    }
    
    func subtraction<type : Numeric>(first : type, second : type) -> type{
        return first-second
    }
    
    func multiplication<type : Numeric>(first : type, second : type) -> type{
        return first*second
    }
    
    func division(first : Int, second : Int) -> Float{
        return Float(first)/Float(second)
    }
    
    func checkForDecimalVal(combinedString : String, count : Int) -> Bool{
        if(combinedString.prefix(count-1).contains(".") || combinedString.suffix(combinedString.count - count).contains(".")){
            return true
        }
        return false
    }
}
