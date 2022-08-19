//
//  TravelView.swift
//  TripIT
//
//  Created by lionel jones on 8/15/22.
//

import SwiftUI
import RealmSwift

struct TravelView: View {
    @ObservedResults(TravelDetailItem.self) var TDItems
    
    @State private var showAlert = false
    
    @State private var Destination = ""
    @State private var Year  = ""
    @State private var TravelDate  = ""
    @State private var Airline  = ""
    @State private var BookingCode  = ""
    @State private var Hotel  = ""
    @State private var APCode  = ""
    
    //dismissing the keyboard
    @Environment(\.dismiss) private var dismiss
    
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
                    addTravelItem()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                .disabled(Destination == "" && Year == "" && TravelDate != "")
                .alert("Missing Field Entries",isPresented: $showAlert) {
                    Button("Ok",role: .cancel) {
                        //you could add more code here if you wanted to
                    }
                }
                    
            } //VStack
            .navigationBarTitle("Trip Entry", displayMode: .inline)
        }//ZStack
        
    }
    
    enum MyError: Error{
        case runtimeError(String)
    }
    
    func addTravelItem() {
       if Destination != ""
           && Year != ""
           && TravelDate != ""
           && Airline != ""
           && BookingCode != ""
           && Hotel != ""
           && APCode != "" {
            
            do {
                let uuid = UUID().uuidString
                
                let TDNewItem = TravelDetailItem(owner_id:uuid,
                                                 Destination: Destination,
                                                 Year: Year,
                                                 TravelDate: TravelDate,
                                                 Airline: Airline,
                                                 BookingCode: BookingCode,
                                                 Hotel: Hotel,
                                                 APCode: APCode)
                print(TDNewItem)
                
                guard Destination != "" else {
                    throw MyError.runtimeError("Need a Destination at least to save a record")
                }
                $TDItems.append(TDNewItem)
                dismiss()
                clearRecord()
                print("Succesfully Wrote Record to Realm Local..")
              
            }
            catch {
                onFailure()
                print("Failed to write record  to Realm Local:  \(error.localizedDescription)")
            }
           
        }
        else {
            showAlert.toggle()
        }
       
    }
    
    func onFailure(){
        
    }
    
    func clearRecord(){
        Destination = ""
        Year  = ""
        TravelDate  = ""
        Airline  = ""
        BookingCode  = ""
        Hotel  = ""
        APCode  = ""
    }
}

struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        TravelView()
    }
}



 /*
 let _ = try!Realm()
 
 let user = realmApp.currentUser!
 let partitionValue = "BookingCode"
 let configuration = user.configuration(partitionValue: partitionValue)

 
 Realm.asyncOpen(configuration: configuration) {
     (result) in
     switch result {
     case.failure(let error) :
         print("Failed to open realm: \(error.localizedDescription)")
     case .success(_):
         print("Realm Opened")
         let TDNewItem = TravelDetailItem(Destination: Destination, Year: Year, TravelDate: TravelDate, Airline: Airline, BookingCode: BookingCode, Hotel: Hotel, APCode: APCode)
         print(TDNewItem)
         //add item to Realm
         /*
         try! realm.write {
             realm.add(TDNewItem)
         }
          */
         $TDItems.append(TDNewItem)
         clearRecord()
         print("Succesfully Wrote Record to Realm Atlas..")
         
     }
 }
  
  
  
  let realm = try!Realm()
  
 
  let user = realmApp.currentUser!
  let partitionValue = "BookingCode"
  let configuration = user.configuration(partitionValue: partitionValue)
  Realm.asyncOpen(configuration: configuration) {
      (result) in
      switch result {
      case.failure(let error) :
          print("Failed to open realm: \(error.localizedDescription)")
      case .success(let realm):
          print("Realm Opened")
      }
  }
  */
  
 
 
 
