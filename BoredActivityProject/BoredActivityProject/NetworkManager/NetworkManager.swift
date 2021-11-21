//
//  NetworkManager.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

enum ActivityFetchError: Error {
    case activityRequestError
    case urlNotSetup
    case customError(message: String)
}

protocol NetworkManagerProtocol {
    func fetchActivity(completionHandler: @escaping (Result<ActivityModel, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    private let domainUrlString = "http://www.boredapi.com/api/activity/"
    
    let session: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.session = urlSession
    }
    
    /// Fetch a random activity from an url
    /// Result will be an ActivityModel or error based on the request result
    func fetchActivity(completionHandler: @escaping (Result<ActivityModel, Error>) -> Void) {
        guard let url = URL(string: domainUrlString) else {
            completionHandler(.failure(ActivityFetchError.urlNotSetup))
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completionHandler(.failure(ActivityFetchError.customError(message: error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      completionHandler(.failure(ActivityFetchError.activityRequestError))
                      return
                  }
            
            do {
                if let data = data {
                    let activityDetails = try JSONDecoder().decode(ActivityModel.self, from: data)
                    completionHandler(.success(activityDetails))
                }
            } catch {
                completionHandler(.failure(ActivityFetchError.customError(message: error.localizedDescription)))
            }
        })
        task.resume()
    }
}
