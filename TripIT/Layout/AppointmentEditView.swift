//
//  AppointmentEditView.swift
//  TripIT
//
//  Created by lionel jones on 8/26/22.
//

import SwiftUI
import RealmSwift



struct AppointmentEditView: View {
    
    @ObservedRealmObject var appointmentItem : Appointment
    var itemToEdit: Appointment?
    
    @State private var showAlert = false
    
    @State private var AppDate = ""
    @State private var AppType  = ""
    @State private var ContactPerson  = ""
    @State private var Status  = ""
    @State private var Location  = ""
    @State private var Cost = ""
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
    
    init(appointmentItem:Appointment,itemToEdit:Appointment? = nil) {
        self.appointmentItem = appointmentItem
        self.itemToEdit = itemToEdit
        
        if let _itemToEdit = itemToEdit {
            _AppDate = State(initialValue: _itemToEdit.AppDate)
            _AppType = State(initialValue: _itemToEdit.AppType)
            _ContactPerson = State(initialValue: _itemToEdit.ContactPerson)
            _Status = State(initialValue: _itemToEdit.Status)
            _Location = State(initialValue: _itemToEdit.Location)
            _Cost = State(initialValue: String(_itemToEdit.Cost!))
            _Notes = State(initialValue: _itemToEdit.Notes)
        }
        
    }

    
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
                TextEditor(text: $Notes)
                        .padding()
                        .frame(width: 300, height: 200)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        
                Button("Update") {
                    editAppItem()
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
    }
    
    func editAppItem() {
        if let itemToEdit = itemToEdit {
            do {
                let realm = try Realm()
                guard let objectToUpdate = realm.object(ofType: Appointment.self, forPrimaryKey: itemToEdit._id) else {return}
                try realm.write {
                    objectToUpdate.AppDate = AppDate
                    objectToUpdate.AppType = AppType
                    objectToUpdate.ContactPerson = ContactPerson
                    objectToUpdate.Status = Status
                    objectToUpdate.Location = Location
                    objectToUpdate.Cost = Double(Cost)
                    objectToUpdate.Notes = Notes
                }
                dismiss()
            }
            catch {
                print(error)
            }
        }
    }
}

/*
struct AppointmentEditView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentEditView()
    }
}
 */
