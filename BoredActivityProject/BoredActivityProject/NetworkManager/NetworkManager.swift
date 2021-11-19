//
//  NetworkManager.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

enum ActivityFetchError: Error {
    case activityNotFound
    case urlNotSetup
    case customError(message: String)
}

final class NetworkManager {
  private let domainUrlString = "http://www.boredapi.com/api/activity/"
  
  func fetchActivity(completionHandler: @escaping (Result<ActivityModel, Error>) -> Void) {
      guard let url = URL(string: domainUrlString) else {
          completionHandler(.failure(ActivityFetchError.urlNotSetup))
          return
      }

    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
          completionHandler(.failure(ActivityFetchError.customError(message: error.localizedDescription)))
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(ActivityFetchError.activityNotFound))
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
