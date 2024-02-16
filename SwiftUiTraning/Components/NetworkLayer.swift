//
//  NetworkLayer.swift
//  SwiftUiTraning
//
//  Created by mobin on 2/13/24.
//

import Foundation
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchData<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

