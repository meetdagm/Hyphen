//
//  FlightSearch.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/26/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

class HotelSearch {
    
    static func search(usingSearchModel searchModel: HotelSearchModel, completionHandler: @escaping (Data?) -> Void) {
        let headers = [
            "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
            "x-rapidapi-key": "41cbec43f7mshabaac46a044c3cap143c04jsn158d226f08b0"
        ]
        
        let request = NSMutableURLRequest(url: searchModel.getURL() as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
            if (error != nil) {
                print(error)
                completionHandler(nil)
            } else {
                    completionHandler(data)
                }
            })
        dataTask.resume()
    }
    
}

class HotelDetailSearch {
    
    static func search(usingSearchModel model: HotelModel, completionHandler: @escaping (_ model: HotelDetailModel?) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
            "x-rapidapi-key": "41cbec43f7mshabaac46a044c3cap143c04jsn158d226f08b0"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://tripadvisor1.p.rapidapi.com/hotels/get-details?location_id=\(model.location_id)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                guard let responseData = data, let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary, let model = try? JSONDecoder().decode(HotelDetailModel.self, from: responseData)
                    else { print("Error from JSON SERIALIZATION"); completionHandler(nil); return }
                print(jsonData)
                completionHandler(model)
            }
            completionHandler(nil)
        })
        
        dataTask.resume()
    }
    
}
