//
//  TDRoot.swift
//  TripIT
//
//  Created by lionel jones on 8/24/22.
//

import Foundation
struct TDRoot: Decodable {
    //below is for testing with localhost:5001
    //let travelRecord: [TravelDetailHistory]
    let travel: [TravelDetailHistory]
}
