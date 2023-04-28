//
//  URLSessionService.swift
//  SampleDemo
//
//  Created by Nouman Gul Junejo on 28/04/2023.
//

import Foundation

struct URLSessionService {
    
    static func fetchData<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    static func fetchData<T: Codable>(url: URL) async throws -> (Result<T, Error>) {
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse, userInfo: nil)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(T.self, from: data)
        return .success(decodedData)
    }
}
