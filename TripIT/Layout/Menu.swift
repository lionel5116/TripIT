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
                    /*
                    NavigationLink(destination:TravelItemsView(travelDetailItem:TravelDetailItem()))
                    {
                        Text("Travel Items")
                            .frame(width: 280, height: 50)
                            .font(.system(size:20,weight: .bold,design: .default))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                   }
                     */
                    CommonNavigationLink(destination:TravelItemsView(travelDetailItem:TravelDetailItem()), btnTitle: "Travel Items",
                                         btnWidth: 280,
                                         btnHeight: 50,
                                         fontWeight: .bold,
                                         foregroundColor: .white,
                                         backgroundColor: Color.blue,
                                         conrnerRadius: 30,
                                         font: .system(size:20,design: .default))
                       
                 
                    CommonNavigationLink(destination: AppointmentItemsView(appointmentItem: Appointment()), btnTitle: "Appointments/Sessions",
                                         btnWidth: 280,
                                         btnHeight: 50,
                                         fontWeight: .bold,
                                         foregroundColor: .white,
                                         backgroundColor: Color.blue,
                                         conrnerRadius: 30,
                                         font: .system(size:20,design: .default))
                    
                    CommonNavigationLink(destination: TravelItemsHistory(), btnTitle: "View Travel History",
                                         btnWidth: 280,
                                         btnHeight: 50,
                                         fontWeight: .bold,
                                         foregroundColor: .white,
                                         backgroundColor: Color.blue,
                                         conrnerRadius: 30,
                                         font: .system(size:20,design: .default))
                       
                    CommonNavigationLink(destination: SearchTravel(), btnTitle: "Search Travel",
                                         btnWidth: 280,
                                         btnHeight: 50,
                                         fontWeight: .bold,
                                         foregroundColor: .white,
                                         backgroundColor: Color.blue,
                                         conrnerRadius: 30,
                                         font: .system(size:20,design: .default))
                    
                    CommonNavigationLink(destination: ContentView(), btnTitle: "Main",
                                         btnWidth: 280,
                                         btnHeight: 50,
                                         fontWeight: .bold,
                                         foregroundColor: .white,
                                         backgroundColor: Color.gray,
                                         conrnerRadius: 30,
                                         font: .system(size:20,design: .default))
                  
                   
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
