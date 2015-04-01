//
//  Animal.swift
//  Lesson03
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class Animal: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func prettyAnimalName() -> String {
        return "Animal name: " + self.name
    }
}

class Dog: Animal {
    var fixed: Bool = false
    let isMale: Bool
    
    init (name: String, isMale:Bool) {
        self.isMale = isMale
        super.init(name: name)
    }
    
    override func prettyAnimalName() -> String {
        return self.name + self.profileString()
    }
    
    func profileString() -> String {
        let randomIndex = rand() % 5
        let possesive = isMale ? "his" : "her"
        let genderedPronoun = isMale ? "him" : "her"

        
        if self.fixed {
            return " is just looking for companionship."
        } else {
            switch randomIndex {
            case 0:
                return " wants a big litter."
            case 1:
                return " hopes \(possesive) ex sees \(genderedPronoun) here."
            case 2:
                return " is lookin' to mingle."
            case 3:
                return " is tired of pant legs."
            default:
                return " really isn't picky."
                
            }
        }
    }
    
}
