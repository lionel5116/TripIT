//
//  TravelDetailItem.swift
//  TripIT
//
//  Created by lionel jones on 8/16/22.
//

import Foundation
import RealmSwift

class Appointment: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var AppDate : String
    @Persisted var AppType : String
    @Persisted var ContactPerson : String
    @Persisted var Status : String
    @Persisted var Location : String
    @Persisted var Cost : Double?
    @Persisted var Notes : String
    
    convenience init(AppDate : String,
                     AppType: String,
                     ContactPerson:String,
                     Status:String,
                     Location:String,
                     Cost: Double?,
                     Notes:String
                    
    ) {
        self.init()
        self.AppDate = AppDate
        self.AppType = AppType
        self.ContactPerson = ContactPerson
        self.Status = Status
        self.Location = Location
        self.Cost = Cost
        self.Notes = Notes
     }
    
}

