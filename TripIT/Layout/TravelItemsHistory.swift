//
//  TravelItemsHistory.swift
//  TripIT
//
//  Created by lionel jones on 8/23/22.
//

import SwiftUI

struct TravelItemsHistory: View {
    @State private var travelItemsArray = []
    
    var body: some View {
        VStack {
            Button("Fetch Travel History") {
                fetchTravelHistoryItemsFromMongoDBAtlas()
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.green)
            .cornerRadius(10)
        }
    }
    
    func fetchTravelHistoryItemsFromMongoDBAtlas() {
        let body: [String: Any]  = ["BookingCode": "","Airline": "Spirit","APCode": "","Status": "","Year": "","SearchType": "Airline"]
        guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/travel/searchTravelRecord") else {return}
        
        var request = URLRequest(url: _url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions())
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with:request) {
            (data, response, error) in
            print("-----> error: \(String(describing: error))")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            /*
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                //print("responseJSON: \(responseJSON)")
            }
            */
            var _arrTravelDetailHistory : [TravelDetailHistory]
            //you use the [TravelDetailHistory] because you want to store in an array
            //the issue is that you are getting back a dictionary as oppossed to an array
            _arrTravelDetailHistory = try! JSONDecoder().decode([TravelDetailHistory].self, from: data)
            print(_arrTravelDetailHistory)
            //let jsondata = try! JSONSerialization.jsonObject(with: data, options: [])
            
        }
        .resume()
    }
}

/*
struct TravelItemsHistory_Previews: PreviewProvider {
    static var previews: some View {
        TravelItemsHistory()
    }
}
 */
