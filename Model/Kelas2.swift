///Users/lukiusjonathan/Desktop/Nano Challenge 1/CaloriesCount/Model/Kelas2.swift
//  Kelas2.swift
//  CaloriesCount
//
//  Created by Lukius Jonathan on 03/03/20.
//  Copyright © 2020 Lukius Jonathan. All rights reserved.
//

import Foundation
class Kelas2{
    var weight:Double
    var height:Double
    var age :Double
    
    init(height:Double,weight:Double,age:Double) {
        self.height=height
        self.weight=weight
        self.age=age
    }

    func hitungberattinggicewe() -> Double{
        return 447.593 + (9.247 * weight)+(3.098 * height)-(4.33 * age)
    }
}
