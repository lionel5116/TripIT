//
//  AppointmentView.swift
//  TripIT
//
//  Created by lionel jones on 8/25/22.
//

import SwiftUI
import RealmSwift

struct AppointmentView: View {
    
    @ObservedResults(Appointment.self) var APPmtItems
    
    @State private var showAlert = false
    
    @State private var AppDate = ""
    @State private var AppType  = ""
    @State private var ContactPerson  = ""
    @State private var Status  = ""
    @State private var Location  = ""
    @State private var Cost  = ""
    @State private var Notes  = ""
    
    //dismissing the keyboard
    @Environment(\.dismiss) private var dismiss
    
    private let appTypes: [String] = [
       "Tour",
       "Session",
       "Meeting",
       "FTPower"
    ]
    private let Statuses: [String] = [
       "Pending",
       "Booked",
       "Complete"
    ]
    
    /*
    self.AppDate = AppDate
    self.AppType = AppType
    self.ContactPerson = ContactPerson
    self.Status = Status
    self.Location = Location
    self.Cost = Cost
    self.Notes = Notes
     */

    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("Appointments")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Picker("Appointment Type",
                       selection: $AppType) {
                    ForEach(appTypes, id: \.self) {
                        appType in
                        Text(appType)
                    }
                }.pickerStyle(.segmented)
                .padding()
                
                TextField("Date", text: $AppDate)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("ContactPerson", text: $ContactPerson)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Location", text: $Location)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                TextField("Cost", text: $Cost)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                Picker("Status",
                       selection: $Status) {
                    ForEach(Statuses, id: \.self) {
                        status in
                        Text(status)
                    }
                }.pickerStyle(.segmented)
                .padding()
                TextField("Notes", text: $Notes)
                        .padding()
                        .frame(width: 300, height: 200)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                Button("Schedule") {
                    addAppItem()
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(10)
                .disabled(Location == "" && AppDate == "" && AppType != "")
                .alert("Missing Field Entries",isPresented: $showAlert) {
                    Button("Ok",role: .cancel) {
                        //you could add more code here if you wanted to
                    }
                }
                 
        } //VStack
      }//ZStack
   }//Some View
    
    enum MyError: Error{
        case runtimeError(String)
    }
    
    func clearRecord(){
        AppDate = ""
        AppType  = ""
        ContactPerson  = ""
        Status  = ""
        Location  = ""
        Cost  = ""
        Notes  = ""
    }
    
    func addAppItem() {
        if AppDate != ""
            && AppType != ""
            && ContactPerson != ""
            && Status != ""
            && Location != ""
            && Cost != ""
            && Notes != "" {
            
            
            do {
                let appNewItem = Appointment(AppDate: AppDate,
                                             AppType: AppType,
                                             ContactPerson: ContactPerson,
                                             Status: Status,
                                             Location:Location,
                                             Cost:Double(Cost),
                                             Notes: Notes)
                print(appNewItem)
                
                guard AppDate != "" else {
                    throw MyError.runtimeError("Need a Destination at least to save a record")
                }
                $APPmtItems.append(appNewItem)
                dismiss()
                clearRecord()
                print("Succesfully Wrote Record to Realm Local..")
            }
            catch {
                print("Failed to write record  to Realm Local:  \(error.localizedDescription)")
            }
           
        }
        else {
            showAlert.toggle()
        }
    }//functon addAppItem
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
