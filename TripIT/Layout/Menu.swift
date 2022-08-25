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
                    
                    //environment(\.realmConfiguration,(realmApp.currentUser?.configuration(partitionValue: "owner_id"))!)
                    NavigationLink(destination:TravelItemsView(travelDetailItem:TravelDetailItem()))
                    {
                        Text("Travel Items")
                            .frame(width: 280, height: 50)
                            .font(.system(size:20,weight: .bold,design: .default))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                   }
                    NavigationLink(destination: AppointmentView()) {
                        Text("Appointments/Sessions")
                            .frame(width: 280, height: 50)
                            .font(.system(size:20,weight: .bold,design: .default))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                   }
                    NavigationLink(destination:TravelItemsHistory())
                    {
                        Text("View Travel History")
                            .frame(width: 280, height: 50)
                            .font(.system(size:20,weight: .bold,design: .default))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                   }
                    NavigationLink(destination: SearchTravel()) {
                        Text("Search Travel")
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
