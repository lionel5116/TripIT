//
//  TravelSearachResultsView.swift
//  TripIT
//
//  Created by lionel jones on 8/24/22.
//

import SwiftUI

struct TravelSearachResultsView: View {
    
    @State var arrTDdata: [TravelDetailHistory]
    
    var body: some View {
        
        VStack {
            List {
                ForEach(arrTDdata, id: \._id) {
                    TDItem in
                    
                    Text(TDItem.BookingCode)
                        .foregroundColor(.green)
                        .bold()
                    Text(TDItem.Destination)
                    Text(TDItem.Airline)
                    Text(TDItem.TravelDate)
                    Text(TDItem.Year)
                    
                }
            }///List
            
        }//VStack
    }
    
}

/*
struct TravelSearachResultsView_Previews: PreviewProvider {
    static var previews: some View {
        TravelSearachResultsView()
    }
}
*/
