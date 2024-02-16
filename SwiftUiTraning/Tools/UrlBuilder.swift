//
//  UrlBuilder.swift
//  SwiftUiTraning
//
//  Created by mobin on 5/24/23.
//

import Foundation



class UrlBuilder {
    
    func buildURl(id: String) -> String {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "themealdb.com"
        component.path = "/api/json/v1/1/lookup.php"
        component.queryItems = [URLQueryItem(name: "i", value: id)]
        return component.url!.absoluteString
    }
}
