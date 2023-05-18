//
//  Roll.swift
//  DiceRoller
//
//  Created by Emiliano Apodaca on 18/05/23.
//

import SwiftUI

struct Roll: View {
    let rolls : [(Int,Int)]
    
    let mod : Int
    
    var body: some View {
        VStack{
            Text("Roll")
                .font(.title)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            Spacer()
            let rolled = rollDice()
            if rolls.filter({i in i.0 != 0}).isEmpty {
                Text("Please select a number of dice")
            } else {
                if (mod < 0){
                    Text("Your roll a \(rolled) - \(-mod) = \(rolled + mod)")
                } else {
                    Text("Your roll a \(rolled) + \(mod) = \(rolled + mod)")
                }
            }
            Spacer()
        }
    }
}

struct Roll_PreviewsPostive: PreviewProvider {
    static var previews: some View {
        Roll(rolls: [(1,8)], mod: 5)
    }
}

struct Roll_PreviewsNegative: PreviewProvider {
    static var previews: some View {
        Roll(rolls: [(1,8)], mod: -5)
    }
}

struct Roll_PreviewsNegativeNoDice: PreviewProvider {
    static var previews: some View {
        Roll(rolls: [], mod: -5)
    }
}

extension Roll {
    func rollDice() -> Int {
        var sumRolls = 0
        rolls.forEach { numberAndDice in
            let dice = numberAndDice.1
            if (0 < numberAndDice.0) {
                for _ in 1...numberAndDice.0 {
                    sumRolls += Int.random(in: 1...dice)
                }
            }
            
        }
        return sumRolls
    }
}
