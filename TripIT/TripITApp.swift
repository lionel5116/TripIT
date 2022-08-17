//
//  TripITApp.swift
//  TripIT
//
//  Created by lionel jones on 8/14/22.
//

import SwiftUI
import RealmSwift

let realmApp = RealmSwift.App(id:"triptracker-kiwjn")

@main
struct TripITApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
 
