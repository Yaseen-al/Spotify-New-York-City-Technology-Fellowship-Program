//: Playground - noun: a place where people can play

import UIKit

//Question 1 -- sortByStrings(s,t): Sort the letters in the string s by the order they occur in the string t. You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".

let testCaseOne = (s: "weather", t: "therapyw", answer: "theeraw")
func sortByStrings(_ s: String, _ t: String)->String{
    /*Since I can assume t will not have repetitive characters.
     - I can build a dictionary with it's characters where keys are the characters and values are their positions
     - Then I will sort characters in s based on their position in t
    */
    var myDictionary = [Character: Int]()
    let tArray = Array(t)
    for i in 0..<tArray.count{
        myDictionary[tArray[i]] = i
    }
    return String(s.sorted{ myDictionary[$0] ?? 0 < myDictionary[$1] ?? 0})
}
sortByStrings(testCaseOne.s, testCaseOne.t)
