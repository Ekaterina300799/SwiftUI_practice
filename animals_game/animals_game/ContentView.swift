//
//  ContentView.swift
//  animals_game
//
//  Created by Ekaterina Tarasova on 24.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animals = ["cat", "cow", "elephants", "horses", "liens", "monkey", "panda", "penguins", "rabbits", "koalas"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                VStack{
                    Text("Find an animal:")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.black)
                    Text(animals[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0..<3){number in
                    Button(action: {
                        self.tappedAns(number)
                        self.showingScore = true
                    }){
                        Image(self.animals[number])
                            .renderingMode(.original)
                            .frame(width:200, height:200)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 3))
                    }
                }
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
            }
        }.alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text("Total score: \(score)"), dismissButton:
                    .default(Text("Continue")){
                        self.askQuestion()
                    })
        }
    }
    
    func askQuestion(){
        animals.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func tappedAns(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Right answer!!!"
            score += 1
        }else{
            scoreTitle = "Wrong! This is \(animals[number])"
            score -= 1
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
