//
//  APIProvider.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import Foundation
import Combine

protocol APIProviderProtocol {
    func getData(from endpoint: EndpointProtocol) -> AnyPublisher<Data, Error>
    func performRequest(for endpoint: EndpointProtocol) -> URLRequest?
}

/// The APIProvider implementing a generic EndpointProtocol containing data header of the HTTP request
class APIProvider<Endpoint: EndpointProtocol> {
    func getData(from endpoint: EndpointProtocol) -> AnyPublisher<Data, Error> {
        guard let request = performRequest(for: endpoint) else {
            return Fail(error: APIProviderErrors.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return loadData(with: request)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Request building
    func performRequest(for endpoint: EndpointProtocol) -> URLRequest? {
        guard var urlComponents = URLComponents(string: endpoint.absoluteURL) else {
            return nil
        }

        urlComponents.queryItems = endpoint.params.compactMap({ param -> URLQueryItem in
            return URLQueryItem(name: param.key, value: param.value)
        })

        guard let url = urlComponents.url else {
            return nil
        }

        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
        
        endpoint.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
    // MARK: - Loading data
    private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError({ error -> Error in
                APIErrors(rawValue: error.code.rawValue) ?? APIProviderErrors.unknownError
            })
            .map {
                $0.data
            }
            .eraseToAnyPublisher()
    }
}
