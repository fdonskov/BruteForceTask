//
//  OperationBruteForce.swift
//  BruteForceTask
//
//  Created by Федор Донсков on 12.07.2022.
//

import Foundation

class OperationBruteForce {
    
    func bruteForce(passwordToUnlock: String) {
        let allowedCharacters: [String] = String().printable.map { String($0) }
        var password: String = ""
        
        while password != passwordToUnlock {
            password = generateBruteForce(password, fromArray: allowedCharacters)
            print(password)
        }
        print(password)
    }
    
    func indexOf(character: Character, _ array: [String]) -> Int {
        return array.firstIndex(of: String(character)) ?? 0
    }
    
    func characterAt(index: Int, _ array: [String]) -> Character {
        return index < array.count ? Character(array[index]) : Character("")
    }
    
    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var result: String = string
        
        if result.count <= 0 {
            result.append(characterAt(index: 0, array))
        } else {
            result.replace(at: result.count - 1, with: characterAt(index: (indexOf(character: result.last ?? Character("nil"), array) + 1) % array.count, array))
            
            if indexOf(character: result.last ?? Character("nil"), array) == 0 {
                result = String(generateBruteForce(String(result.dropLast()), fromArray: array)) + String(result.last ?? Character("nil"))
            }
        }
        return result
    }
}
