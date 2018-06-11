//: Playground - noun: a place where people can play

import UIKit
import XCTest
/*
Given an encoded string, return its corresponding decoded string.
 
The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is repeated exactly k times. Note: k is guaranteed to be a positive integer.

For s = "4[ab]", the output should be decodeString(s) = "abababab"
For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"
*/
func decodeString(s: String)->String{
    var outputString = String()
    let sArrayRiversed = Array(s.filter{$0 != "[" && $0 != "]"}.reversed())
    var encodedString = ""
    for i in 0..<sArrayRiversed.count {
        if let newKtimes = Int(String(sArrayRiversed[i])){
            outputString = String.init(repeating: encodedString, count: newKtimes)
            encodedString = outputString
            continue
        }
        encodedString.append(sArrayRiversed[i])
    }
    return String(outputString.reversed())
}

class Examples: XCTestCase {
    static public func testExampleOne(){
        let testCaseOne = (s: "4[ab]", answer: "abababab")
        let testResult = decodeString(s: testCaseOne.s)
        XCTAssertEqual(testResult, testCaseOne.answer, "\(testResult) is no equal to \(testCaseOne.answer)")
    }
    static public func testExampleTwo(){
        let testCaseTwo = (s: "2[b3[a]]", answer: "baaabaaa")
        let testResult = decodeString(s: testCaseTwo.s)
        XCTAssertEqual(testResult, testCaseTwo.answer, "\(testResult) is no equal to \(testCaseTwo.answer)")    }
    static public func testExampleThree(){
        let testCaseTwo = (s: "2[yaa3[ss]]", answer: "yaassssssyaassssss")
        let testResult = decodeString(s: testCaseTwo.s)
        XCTAssertEqual(testResult, testCaseTwo.answer, "\(testResult) is no equal to \(testCaseTwo.answer)")    }
}

Examples.testExampleTwo()
Examples.testExampleOne()
Examples.testExampleThree()


