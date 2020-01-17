//
//  CitySearch.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

struct CityData: Decodable, DescribableText {
    
    var result_object: City
    
    var text: String {
        if let abbrvState = result_object.ancestors.first?.abbrv {
            return "\(result_object.name), \(abbrvState)"
        }
        return "\(result_object.name), \(result_object.ancestors.first?.name ?? "")"
    }
    
    var description: String {
        return "\(result_object.ancestors.last!.name)"
    }
}

struct CityList: Decodable {
    var data: [CityData]
}

struct City: Codable {
    var latitude: String
    var longitude: String
    var location_id: String
    var name: String
    var location_string: String
//    var parent_display_name: String
    var ancestors: [CityDetail]
}

struct CityDetail: Codable {
    var name: String
    var abbrv: String?
}

struct CityQuery {
    private(set) var query: String
    private(set) var lang = "en_US"
    private(set) var units = "km"
    
    init(withSearchTerm term: String) {
        query = term
    }
} 


class CitySearch: SearchableAPI {
    
    private(set) var cityCollection: ItemCollection<DescribableText>
    
    init(withCollection collection: ItemCollection<DescribableText>) {
        cityCollection = collection
    }
    
    
    func search(text: String, completionHandler: @escaping (CollectionModel) -> Void) {
        let cityQuery = CityQuery(withSearchTerm: text)
        queryCity(withQuery: cityQuery) { [weak self] (responseData) in
            guard let weakSelf = self else { fatalError("City Search Deallocated") }
            guard let data = responseData else { print("No New City Found"); completionHandler(weakSelf.cityCollection); return }
            guard let jsonSerialization = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else { print("JSON SERIALIZATION not working in city"); completionHandler(weakSelf.cityCollection); return}
            print("City found: ", jsonSerialization)
            guard let cityList = try? JSONDecoder().decode(CityList.self, from: data) else { print("Decoding not working for City search"); completionHandler(weakSelf.cityCollection); return }
            
            weakSelf.cityCollection.overwriteCollection(with: cityList.data)
            completionHandler(weakSelf.cityCollection)
        }
        
    }
    
    private func queryCity(withQuery query: CityQuery, completionHandler: @escaping (Data?) -> Void) {
        let headers = [
            "x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
            "x-rapidapi-key": "41cbec43f7mshabaac46a044c3cap143c04jsn158d226f08b0"
        ]
        guard let url = NSURL(string: "https://tripadvisor1.p.rapidapi.com/locations/search?query=\(query.query)&lang=\(query.lang)&units=\(query.units)") as URL? else { completionHandler(nil); return }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 15.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completionHandler(nil)

            } else {
                
                completionHandler(data)
            }
        })
        
        dataTask.resume()

    }
    
}
