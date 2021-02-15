//
//  ContentView.swift
//  TapToSnap
//
//  Created by Archit Rai Saxena on 15/02/21.
//  Copyright © 2021 ArchitRaiSaxena. All rights reserved.
//

import Foundation
import Combine

class GameItemNetworkService {

    private var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "hoi4nusv56.execute-api.us-east-1.amazonaws.com"
        components.path = "/iositems/items"
        return components
    }

    func fetchGameItems() -> AnyPublisher <[GameItem], Error> {
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map { $0.data }
            .decode(type: [GameItem].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
