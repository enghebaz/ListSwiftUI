//
//  APIService.swift
//  ListSwiftUI
//
//  Created by Heba on 26/05/2022.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    func getMainList() -> AnyPublisher<Response, Error> {
        let components = URLComponents(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer")!
        
        
        let request = URLRequest(url: components.url!, timeoutInterval: 5)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
