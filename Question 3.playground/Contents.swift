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

func changePossibilities(_ amount: Int,_ dominations: [Int]){
    var possibilities = [Int]()
    var answers = [[Int]]()
    for domination in dominations where domination <= amount{
        if amount - domination < 0 {
            continue
        }
        else if  amount - domination == 0 {
            print(domination)
        }
        else{
            possibilities.append(domination)
            possibilities.append(contentsOf: changePossibilitiesHelper(amount-domination, dominations))
            guard !possibilities.isEmpty else {
                continue
            }
            answers.append(possibilities)
            print(possibilities)
            possibilities.removeAll()
        }
    }
}

/*
 The helper function finds the possible compination for a decrementing amount used by the parent function
 */
func changePossibilitiesHelper(_ amount: Int,_ dominations: [Int])->[Int]{
    guard amount >= 0 else {
        return []
    }
    var possibilities = [Int]()
    for domination in dominations {
        if amount - domination > 0 {
            possibilities.append(domination)
            return changePossibilitiesHelper(amount-domination, dominations) + possibilities
        }
        if amount - domination == 0 {
            possibilities.append(domination)
            return possibilities
        }
    }
    return possibilities
}
//changePossibilitiesHelper(5, [10,3,2,1])
changePossibilities(5, [1,2,3])

class Examples: XCTest{
    func testOne(){
    }
}

