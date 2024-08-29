//
//  Service.swift
//  FuzeApp
//
//  Created by Thiago Monteiro on 28/08/24.
//

import Foundation

protocol ServicingProtocol {
    func fetchData(callback: @escaping (Result<[Matches], Error>) -> Void)
}

public final class Service {
    private let apiURL = "https://api.pandascore.co/matches/upcoming"
    
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
}

extension Service: ServicingProtocol {
    func fetchData(callback: @escaping (Result<[Matches], Error>) -> Void) {
        guard let api = URL(string: apiURL) else { return }
        var request = URLRequest(url: api)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "authorization": ""
        ]
        
        session.dataTask(with: request) { data, response, error in
            if let error { callback(.failure(error)) }
            if let data = data,
               let response = response as? HTTPURLResponse {
                if (200..<300).contains(response.statusCode) {
                    do {
                        let decoder = JSONDecoder()
                        let matches = try decoder.decode([Matches].self, from: data)
                        callback(.success(matches))
                    } catch {
                        callback(.failure(error))
                    }
                }
            }
        }
        .resume()
    }
}
