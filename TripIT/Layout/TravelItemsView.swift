//
//  TravelItemsView.swift
//  TripIT
//
//  Created by lionel jones on 8/19/22.
//

import SwiftUI
import RealmSwift

struct TravelItemsView: View {
    
    //Realm Object - This is our base TravelDetailItem Model (Entering New Travel Detail Items)
    @ObservedResults(TravelDetailItem.self) var TDItems
    
    //Make sure have this is as "ObservedRealmObject and not ObservedObject or you will get an Frozen Error
    @ObservedRealmObject var travelDetailItem : TravelDetailItem
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
            VStack {
                List {
                    
                   
                    
                    ForEach(TDItems, id: \.id) {
                        TDItem in
                        
                        NavigationLink {
                            TravelDetailEditView(travelDetailItem: travelDetailItem,itemToEdit: TDItem)
                        } label: {
                            Text("Edit Record")
                                .foregroundColor(.red)
                        }
                        
                        Text(TDItem.Destination)
                        Text(TDItem.TravelDate)
                        Text(TDItem.BookingCode).opacity(0.4)
                        
                    }.onDelete(perform: $TDItems.remove) //foreach
                }//List
            }
            
        } //VStack
        .sheet(isPresented: $isPresented, content: {
            TravelView()
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



struct TravelItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TravelItemsView(travelDetailItem:TravelDetailItem())
    }
}

