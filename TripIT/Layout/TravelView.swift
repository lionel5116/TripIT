//
//  TravelView.swift
//  TripIT
//
//  Created by lionel jones on 8/15/22.
//

import SwiftUI

struct TravelView: View {
    
    @State private var Destination = ""
    @State private var Year  = ""
    @State private var TravelDate  = ""
    @State private var Airline  = ""
    @State private var BookingCode  = ""
    @State private var Hotel  = ""
    @State private var APCode  = ""
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("Travel Information")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Year", text: $Year)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Destination", text: $Destination)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("TravelDate", text: $TravelDate)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Airline", text: $Airline)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("BookingCode", text: $BookingCode)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Hotel", text: $Hotel)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("APCode", text: $APCode)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                Button("Track") {
                    trackTavel()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                    
            } //VStack
        }//ZStack
      
    }
    func trackTavel() {
        var _Travel = Travel(Destination: Destination, Year: Year, TravelDate: TravelDate, Airline: Airline, BookingCode: BookingCode, Hotel: Hotel, APCode: APCode)
        print(_Travel)
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView()
    }
}
