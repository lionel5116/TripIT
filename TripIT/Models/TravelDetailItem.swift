//
//  TravelDetailItem.swift
//  TripIT
//
//  Created by lionel jones on 8/16/22.
//

import Foundation
import RealmSwift

class TravelDetailItem: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var owner_id : String
    @Persisted var Destination : String
    @Persisted var Year : String
    @Persisted var TravelDate : String
    @Persisted var Airline : String
    @Persisted var BookingCode : String
    @Persisted var Hotel : String
    @Persisted var APCode : String
    @Persisted var timestamp = Date()
    
    convenience init(owner_id : String,
                     Destination: String,
                     Year:String,
                     TravelDate:String,
                     Airline:String,
                     BookingCode: String,
                     Hotel:String,
                     APCode: String
    ) {
        self.init()
        self.owner_id = owner_id
        self.Destination = Destination
        self.Year = Year
        self.TravelDate = TravelDate
        self.Airline = Airline
        self.BookingCode = BookingCode
        self.Hotel = Hotel
        self.APCode = APCode
     }
    
}
