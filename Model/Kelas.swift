//
//  Kelas.swift
//  CaloriesCount
//
//  Created by Lukius Jonathan on 03/03/20.
//  Copyright © 2020 Lukius Jonathan. All rights reserved.
//

import Foundation

class Kelas{
    var weight:Double
    var height:Double
    var age :Double
    
    init(height:Double,weight:Double,age:Double) {
        self.height=height
        self.weight=weight
        self.age=age
    }
    
    func hitungberattinggicowo() -> Double {
        return 88.362 + (13.397 * weight)+(4.799 * height)-(5.677 * age)
    }
    
}
