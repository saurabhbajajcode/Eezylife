//
//  Extensions.swift
//  Eezylife Calendar
//
//  Created by Saurabh Bajaj on 16/02/20.
//  Copyright © 2020 Saurabh. All rights reserved.
//

import UIKit

extension Array {
    func shiftRight(amount: Int = 1) -> [Element] {
        var amount = amount
        assert(-count...count ~= amount, "Shift amount out of bounds")
        if amount < 0 { amount += count }  // this needs to be >= 0
        return Array(self[amount ..< count] + self[0 ..< amount])
    }

    mutating func shiftRightInPlace(amount: Int = 1) {
        self = shiftRight(amount: amount)
    }
}
