//: Playground - noun: a place where people can play

import UIKit

enum Money {
    case dollar
    case quarter
    case dime
    case nickel
    case penny
}

let moneyString = "Your change is"

func makeChange(money: Double) -> String {
    
    for int in money {
        switch Money {
        case .dollar:
            <#code#>
        default:
            break
        }
    }
    
    return moneyString
}

makeChange(4.68)
