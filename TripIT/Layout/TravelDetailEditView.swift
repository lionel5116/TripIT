//
//  TravelDetailEditView.swift
//  TripIT
//
//  Created by lionel jones on 8/19/22.
//

import SwiftUI
import RealmSwift

struct TravelDetailEditView: View {
    
    //Make sure have this is as "ObservedRealmObject and not ObservedObject or you will get an Frozen Error
    @ObservedRealmObject var travelDetailItem : TravelDetailItem
    var itemToEdit: TravelDetailItem?
    
    
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
    
    init(travelDetailItem:TravelDetailItem,itemToEdit:TravelDetailItem? = nil) {
        self.travelDetailItem = travelDetailItem
        self.itemToEdit = itemToEdit
        //print(self.itemToEdit!._id)
        
        //if let = optional binding, it's a test to see if itemToEdit passed in the constructor has a value or not
        //if if does, bind it to itemToEdit on the left side of equation if let itemToEdit
        if let _itemToEdit = itemToEdit {
             //the _Destination allows us to initialize our state variables in our constructor (property wrappers use the _ in the constructor
            //as storage for the @State properties
            _Destination = State(initialValue: _itemToEdit.Destination)
            _Year = State(initialValue: _itemToEdit.Year)
            _TravelDate = State(initialValue: _itemToEdit.TravelDate)
            _Airline = State(initialValue: _itemToEdit.Airline)
            _BookingCode = State(initialValue: _itemToEdit.BookingCode)
            _Hotel = State(initialValue: _itemToEdit.Hotel)
            _APCode = State(initialValue: _itemToEdit.APCode)
        }
    }
    
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
                Button("Update") {
                    editTravelItem()
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
            .navigationBarTitle("Edit Trip Details ", displayMode: .inline)
        }//ZStack
    }
    
    enum MyError: Error{
        case runtimeError(String)
    }

    private func editTravelItem(){
        if let itemToEdit = itemToEdit {
            do {
                let realm = try Realm()
                guard let objectToUpdate = realm.object(ofType: TravelDetailItem.self, forPrimaryKey: itemToEdit._id) else {return}
                try realm.write {
                    objectToUpdate.Destination = Destination
                    objectToUpdate.Year = Year
                    objectToUpdate.TravelDate = TravelDate
                    objectToUpdate.Airline = Airline
                    objectToUpdate.BookingCode = BookingCode
                    objectToUpdate.Hotel = Hotel
                    objectToUpdate.APCode = APCode
                }
                dismiss()
            }
            catch {
                print(error)
            }
        }
    }

    
} //struct TravelDetailEditView: View {



struct TravelDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        TravelDetailEditView(travelDetailItem:TravelDetailItem())
    }
}
 
