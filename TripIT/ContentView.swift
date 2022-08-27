//
//  ContentView.swift
//  TripIT
//
//  Created by lionel jones on 8/14/22.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showMainMenu = false
    
    //realm connect
    @State private var realmDBUserID = "";
    
    //@Published var configuration: Realm.Configuration?
    
    var body: some View {
      //you only need the Navigation View at the Root View
       NavigationView {
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Submit") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    /*
                    Button("Realm Connect") {
                        //connectToRealm()
                        print("Temporarily Diabling this for now ...")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    TextField("RealmUserID", text: $realmDBUserID)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    */
                    
                    NavigationLink(destination: Text("You are logged in \(username)"),isActive: $showingLoginScreen) {
                        EmptyView();
                    }
                    
                    //dynamcally activate navigation of this view based
                    //on a boolean using the isActive attribute
                    NavigationLink(destination: Menu(),isActive: $showMainMenu) {
                        EmptyView();
                    }
                           
                }//VStack
            }  //ZStack 
            
       } //NavigationView
       .navigationBarHidden(true)
       .navigationBarTitle("Feel the Power", displayMode: .inline)
    }//View (body)
    
    func authenticateUser(username: String, password: String) {
        //your own database and logic will go here
        if username.lowercased() == "lionel5116" {
            wrongUsername = 0
            if password.lowercased() == "5116" {
                wrongPassword = 0
                //showingLoginScreen = true
                showMainMenu = true //activate navigation
            }
            else {
                wrongPassword = 2
            }
        } else {
            wrongPassword = 2
        }
    }
    
    func connectToRealm() {
        
       /*
        Task {
           
            do {
                let user = try await realmApp.login(credentials: .anonymous);
                realmDBUserID = user.id;
               
                
                print("Realm UserID: \(realmDBUserID)")
                
                if realmDBUserID != "" {
                    showMainMenu = true //activate navigation
                }
            } catch {
                print("Failed to login to MongodB Realm :  \(error.localizedDescription)")
                realmDBUserID = "Failed to Connect"
            }
        }
        */
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
