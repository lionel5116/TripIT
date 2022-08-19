//
//  TripITApp.swift
//  TripIT
//
//  Created by lionel jones on 8/14/22.
//

import SwiftUI
import RealmSwift

//let realmApp = RealmSwift.App(id:"triptracker-kiwjn")

@main
struct TripITApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false,forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            //this line alows you to print the path of the Realm Document Directory
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
 
