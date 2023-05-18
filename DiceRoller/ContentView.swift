//
//  ContentView.swift
//  DiceRoller
//
//  Created by Emiliano Apodaca on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var modifier = 0
    
    let array = [0,1,2,3,4,5]
    
    @State var numbersAndDice = [(0,4),(0,6),(0,8),(0,10),(0,12),(0,20)]
    
    @State var roll = false
    
    var body: some View {
        VStack{
            Text("Rolling Dices")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
                .multilineTextAlignment(.center)
            List(array, id: \.self) { i in
                HStack{
                    Stepper {
                        if (numbersAndDice[i].0 == 0) {
                            Text("Not rolling d\(numbersAndDice[i].1)")
                        } else {
                            Text("Rolling \(numbersAndDice[i].0)d\(numbersAndDice[i].1)")
                        }
                    } onIncrement: {
                        numbersAndDice[i].0 = numbersAndDice[i].0 + 1
                    } onDecrement: {
                        if(numbersAndDice[i].0 == 0) { return}
                        numbersAndDice[i].0 = numbersAndDice[i].0 - 1
                    }
                    Spacer()
                    Button {numbersAndDice[i].0 = 0} label: {
                        Text("Reset")
                    }
                    .padding()
                }
                .padding()
            }
            VStack {
                HStack{
                    Button {
                        array.forEach { i in
                            numbersAndDice[i].0 = 0
                        }
                    } label: {
                         Text("Reset All")
                    }
                    .padding()
                    VStack {
                        Text("Modifier : \(modifier)")
                            .font(.title2)
                        Stepper("", value:$modifier)
                            .labelsHidden()
                            .padding()
                    }
                    Button {modifier = 0} label: {
                        Text("Reset Modifier")
                    }
                }
            }
            Button {
                roll.toggle()
            } label: {
                Text("Roll")
                    .font(.title2)
                    
            }.buttonStyle(.borderedProminent).sheet(isPresented: $roll) {
                Roll(rolls: numbersAndDice, mod: modifier)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
