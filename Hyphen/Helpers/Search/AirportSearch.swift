//
//  AirportSearch.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/10/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


struct AiportList: Decodable {
    var Places: [Airport]
}


struct AirportQuery {
    private(set) var country = "USA"
    private(set) var currency = "USD"
    private(set) var locale = "en-US"
    private(set) var searchWord: String
    
    init(searchTerm word: String) {
        searchWord = word
    }
}

struct Airport: Decodable, DescribableText {
    
    var PlaceName: String
    var PlaceId: String
    var CountryName: String
    var RegionId: String
    
    var text: String {
        return "\(PlaceName), \(PlaceId)"
    }
    
    var description: String {
        if RegionId != "" {
            return "\(RegionId), \(CountryName)"
        }else {
            return CountryName
        }
    }

}

class AirportSearch: SearchableAPI {
    
    private var airportCollection: ItemCollection<DescribableText>
    
    init(withAirportCollection collection: ItemCollection<DescribableText>) {
        airportCollection = collection
    }
    
    func search(text: String, completionHandler: @escaping (CollectionModel) -> Void) {
        
        let airportQuery = AirportQuery(searchTerm: text)
        if text.count >= 2 {
            queryAirport(airportQuery) { [weak self] (data) in
                guard let weakSelf = self else { fatalError() }
                guard let responseData = data, let airportList = try? JSONDecoder().decode(AiportList.self, from: responseData) else {
                    completionHandler(weakSelf.airportCollection)
                    return
                }
                weakSelf.airportCollection.overwriteCollection(with: airportList.Places)
                completionHandler(weakSelf.airportCollection)
            }
        }
    }
    
    private func queryAirport(_ query: AirportQuery, completionHandler: @escaping (Data?) -> Void) {
        let headers = [
            "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
            "x-rapidapi-key": "41cbec43f7mshabaac46a044c3cap143c04jsn158d226f08b0"
        ]
        
        guard let requestURL = NSURL(string: "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/autosuggest/v1.0/\(query.country)/\(query.currency)/\(query.locale)/?query=\(query.searchWord)") else { return } 
        
        let request = NSMutableURLRequest(url: requestURL as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            completionHandler(data)
        })
        
        dataTask.resume()
    }

}

