//
//  JokeAPI.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import Foundation

enum JokeServiceError: Error {
    case defaultError
    case parsingFailed
}

class JokeService {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    private enum Endpoint {
        static let jokesEndpoint = "https://www.boredapi.com/api/activity"
    }
    
    private let jsonDecoder = JSONDecoder()
    
    func loadJoke(completion: @escaping (Result<Joke, Error>) -> Void) {
        
        guard let url = URL(string: Endpoint.jokesEndpoint) else {
            print("url error")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let result: Result<Joke, Error>
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if let error = error {
                return result = .failure(error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return result = .failure(JokeServiceError.defaultError)
            }
            guard (200..<300).contains(httpResponse.statusCode) else {
                return result = .failure(JokeServiceError.defaultError)
            }
            guard let data = data else {
                return result = .failure(JokeServiceError.defaultError)
            }
            
            do {
                let joke = try self.jsonDecoder.decode(Joke.self, from: data)
                result = .success(joke)
            } catch {
                print("\nResponse:\n\(String(data: data, encoding: .utf8) ?? "")\n")
                return result = .failure(JokeServiceError.parsingFailed)
            }
        }
        dataTask.resume()
    }
}
