//
//  MainMenuView.swift
//  UI_practice
//
//  Created by Ekaterina Tarasova on 01.02.2021.
//

import SwiftUI

struct MainMenuView: View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading, spacing: 12){
                    Image("avatar")
                        .padding(.top, 300.0)
                        .frame(width: 200.0, height: 200.0)
                        .clipShape(Circle())
                    
                    Text("Hey,")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                    Text("Kate")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                    Button(action: {
                        self.index = 0
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 25){
                            Image(systemName: "bag.fill")
                                .foregroundColor(.white)
                            Text("Catalog")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color1") : Color("Color2"))
                        .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    
                    Button(action: {
                        self.index = 1
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 25){
                            Image(systemName: "cart.fill")
                                .foregroundColor(.white)
                            Text("Cart")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color1") : Color("Color2"))
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 2
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        HStack(spacing: 25){
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                            Text("Favorites")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color1") : Color("Color2"))
                        .cornerRadius(10)
                    }
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    Button(action: {
                        //
                    }){
                        HStack(spacing: 25){
                            Image(systemName: "delete.left")
                                .foregroundColor(.white)
                            Text("Log Out")
                                .foregroundColor(.white)
                        }
                        .background(Color("Color2"))
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing: 0){
                HStack(spacing: 35){
                    Button(action: {
                        withAnimation{
                            self.show.toggle()
                        }
                    }){
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 20, height: 20)
                            .foregroundColor(Color.black.opacity(0.4))
                            .padding(.vertical, 30)
                    }
                    Text(self.index == 0 ? "Catalogue" : (self.index == 1 ? "Cart" : "Favorites"))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.4))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader{_ in
                    VStack {
                        if self.index == 0{
                            Catalogue()
                        }
                        else if self.index == 1{
                            Cart()
                        }
                        else{
                            Favorites()
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
        }
        .background(Color("Color2").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}



struct Catalogue: View {
    var body: some View{
        
        VStack{
            Text("Catalogue")
                .padding(.all, 40)
        }
    }
}

struct Cart: View {
    var body: some View{
        
        VStack{
            Text("Cart")
                .padding(.all, 40)
        }
    }
}

struct Favorites: View {
    var body: some View{
        
        VStack{
            Text("Favorites")
                .padding(.all, 40)
        }
    }
}


struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
        
    }
}
