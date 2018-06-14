//: Playground - noun: a place where people can play

import UIKit
import XCTest
/*
 Your quirky boss collects rare, old coins. They found out you're a programmer and asked you to solve something they've been wondering for a long time.
 
 Write a function that, given an amount of money and an array of coin denominations, computes the number of ways to make the amount of money with coins of the available denominations.
 
 Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:
 
 1¢, 1¢, 1¢, 1¢
 1¢, 1¢, 2¢
 1¢, 3¢
 2¢, 2¢
 */
/*
 To get only the number of times
 */
func changePossibilities(_ amount: Int,_ dominations: [Int])->Int{
    return changePossibilitiesHelper(amount, dominations, index: dominations.count - 1)
}
func changePossibilitiesHelper(_ amount: Int,_ dominations: [Int], index: Int)->Int{
    guard index >= 0, amount >= 0 else {return 0}
    if amount == 0{return 1}
    if amount - dominations[index] == 1 {
        return 1 + changePossibilitiesHelper(amount, dominations, index: index - 1)
    }else if amount - dominations[index] < 0 {
        return changePossibilitiesHelper(amount, dominations, index: index - 1)
    }else{
    return changePossibilitiesHelper(amount-dominations[index], dominations, index: index) + changePossibilitiesHelper(amount, dominations, index: index - 1)
    }
}



class Solution: XCTest {
    static public func testCaseOne(){
        let testCaseOne = (amount: 4,dominations: [1,2,3], answer: 4 )
        let testingAnswer = changePossibilities(testCaseOne.amount, testCaseOne.dominations)
        XCTAssertEqual(testingAnswer, testCaseOne.answer, "Your testing answer \(testingAnswer) is not equal to \(testCaseOne.answer)")
    }
}
Solution.testCaseOne()

