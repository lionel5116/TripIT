//
//  TravelItemsHistory.swift
//  TripIT
//
//  Created by lionel jones on 8/23/22.
//

import SwiftUI




struct TravelItemsHistory: View {
    @State var arrTDdata: [TravelDetailHistory] = []
    //This line below is left there because it is used an example of when you do not have pass in a value
    //to this struct if you provide an initial value to the property - see the swiftui doc on asana, going to try again..
    //var testVariable: String = ""
    
    
    var body: some View {
        
        
        
        VStack {
            Button("Fetch Travel History") {
                fetchTravelHistoryItemsFromMongoDBAtlas()
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.green)
            .cornerRadius(10)
            List {
                ForEach(arrTDdata, id: \._id) {
                    TDItem in
                    Text(TDItem.Destination)
                    Text(TDItem.ItineraryFlght)
                    Text(TDItem.TravelDate)
                    Text(TDItem.BookingCode).opacity(0.4)
                    
                }
            }
            
        }
    }
    
    enum MyError: Error{
        case runtimeError(String)
    }
    
    func fetchTravelHistoryItemsFromMongoDBAtlas() {
        let body: [String: Any]  = ["BookingCode": "","Airline": "Spirit","APCode": "","Status": "","Year": "","SearchType": "Airline"]
        guard let _url = URL(string:"https://vast-scrubland-03341.herokuapp.com/api/travel/searchTravelRecord") else {return}
       // guard let _url = URL(string:"http://localhost:5001/api/travel/searchTravelRecordJSON") else {return}
    
        
        var request = URLRequest(url: _url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions())
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with:request) {
            (data, response, error) in
            //print("-----> error: \(String(describing: error))")
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            
            /*
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
               print("responseJSON: \(responseJSON)")
            }
             */
            
            
            do  {
                
                let travelData = try! JSONDecoder().decode(TDRoot.self, from: data)
                
                //below is when testing with localhost:5001
                //let tdHistoryItems = travelData.travelRecord
                
                //this is for Atlas
                let tdHistoryItems = travelData.travel
               
                var oDetails: TravelDetailHistory
                arrTDdata = []
                for tdHistItem in tdHistoryItems {
                    oDetails = TravelDetailHistory(_id:tdHistItem._id,Destination: tdHistItem.Destination, Year: tdHistItem.Year, TravelDate: tdHistItem.TravelDate, Airline: tdHistItem.Airline, Hotel: tdHistItem.Hotel, BookingCode: tdHistItem.BookingCode, APCode: tdHistItem.APCode, ItineraryFlght: tdHistItem.ItineraryFlght, ItineraryHotel: tdHistItem.ItineraryHotel, Status: tdHistItem.Status, FlightCost: tdHistItem.FlightCost, HotelCost: tdHistItem.HotelCost, GirlCost: tdHistItem.GirlCost, TotalCost: tdHistItem.TotalCost, Rating: tdHistItem.Rating, Notes: tdHistItem.Notes)
                   
                    arrTDdata.append(oDetails)
                  
                }
                //print("Printing Array of TravelDetailHistory Items....")
                //print(arrTDdata)
                
                if data != data {
                    throw MyError.runtimeError("No data returned")
                }
                
            }
            catch {
                let error = error
                print(error.localizedDescription)
            }
            
           
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
