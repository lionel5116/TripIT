//
//  Menu.swift
//  TripIT
//
//  Created by lionel jones on 8/15/22.
//

import SwiftUI

struct Menu: View {
    
    var body: some View {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                VStack{
                    
                    NavigationLink(destination: TravelView().environment(\.realmConfiguration,(realmApp.currentUser?.configuration(partitionValue: "owner_id"))!))
                    {
                        Text("Enter Travel Details")
                            .frame(width: 280, height: 50)
                            .font(.system(size:20,weight: .bold,design: .default))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                   }
                    
                    NavigationLink(destination: ContentView()) {
                        Text("Return to Main")
                            .frame(width: 280, height: 50)
                            .font(.system(size:20,weight: .bold,design: .default))
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                   }
                    
                    
                } //VStack
            } //ZStack
       
        .navigationBarHidden(true)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
