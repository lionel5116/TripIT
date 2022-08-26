//
//  AppointmentItemsView.swift
//  TripIT
//
//  Created by lionel jones on 8/26/22.
//

import SwiftUI
import RealmSwift

struct AppointmentItemsView: View {
    
    @ObservedResults(Appointment.self) var APPmtItems
    @ObservedRealmObject var appointmentItem : Appointment
    
    @State private var isPresented: Bool = false
    
    
    var body: some View {
        VStack {
            
            List {
                ForEach(APPmtItems, id: \.id) {
                   appItem in
                    
                    NavigationLink {
                        AppointmentEditView(appointmentItem: appointmentItem,itemToEdit: appItem)
                    } label: {
                        Text(appItem.AppDate)
                            .foregroundColor(.green)
                    }
                    
                    Text(appItem.AppType)
                    Text(appItem.ContactPerson)
                    Text(appItem.Location).opacity(0.4)
                    
                }.onDelete(perform: $APPmtItems.remove) //foreach
            }
        }//VStack
        .sheet(isPresented: $isPresented, content: {
            AppointmentView()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }//toolbar
    }
}

struct AppointmentItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentItemsView(appointmentItem:Appointment())
    }
}
