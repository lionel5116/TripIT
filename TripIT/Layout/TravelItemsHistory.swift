//
//  TravelItemsHistory.swift
//  TripIT
//
//  Created by lionel jones on 8/23/22.
//

import SwiftUI




struct TravelItemsHistory: View {
    @State var arrTDdata: [TravelDetailHistory] = []
    
    
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
       // guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/travel/searchTravelRecord") else {return}
        guard let _url = URL(string:"http://localhost:5001/api/travel/searchTravelRecordJSON") else {return}
    
        
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
            
            
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
               print("responseJSON: \(responseJSON)")
            }
            
            
            //let userInfo = results[0]["userInfo"] as! [String: Any]
            var _arrTravelDetailHistory = try! JSONDecoder().decode(Response.self, from: data)
           //print(_arrTravelDetailHistory)

            
            //var _arrTravelDetailHistory : [TravelDetailHistory]
            //you use the [TravelDetailHistory] because you want to store in an array
            //the issue is that you are getting back a dictionary as oppossed to an array
            //let arrayTDItems = data.travel
            //let _arrTravelDetailHistory = try! JSONDecoder().decode([TravelDetailHistory].self, from: data)
            //self.arrTDdata = _arrTravelDetailHistory
            //print(_arrTravelDetailHistory)
            //let jsondata = try! JSONSerialization.jsonObject(with: data, options: [])
            
            /*BELOW DOES NOT WORK!!, does not decode the json properly
            let json = try! JSONSerialization.jsonObject(with: data)
            let jsonDict = json as! [String: Any]
            let results = jsonDict["travelRecord"] as! [[String: Any]]
            
            var oDetails: TravelDetailHistory
            for tdItem in results{
                print(tdItem)
                    
                    oDetails.Destination= tdItem["Destination"] as! [String: Any]
                    oDetails.Year= tdItem.Year
                    oDetails.TravelDate= tdItem.TravelDate
                    oDetails.Airline= tdItem.Airline
                    oDetails.Hotel= tdItem.Hotel
                    oDetails.BookingCode= tdItem.BookingCode
                    oDetails.APCode= tdItem.APCode
                    oDetails.ItineraryFlght= tdItem.ItineraryFlght
                    oDetails.ItineraryHotel= tdItem.ItineraryHotel
                    oDetails.Status= tdItem.Status
                    oDetails.FlightCost= tdItem.FlightCost
                    oDetails.HotelCost= tdItem.HotelCost
                    oDetails.GirlCost= tdItem.GirlCost
                    oDetails.TotalCost= tdItem.TotalCost
                    oDetails.Rating= tdItem.Rating
                    oDetails.Notes= tdItem.Notes
                }
             */
            
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
