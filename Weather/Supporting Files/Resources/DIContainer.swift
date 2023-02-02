//
//  DIContainer.swift
//  Weather
//
//  Created by Zuhair Hussain on 13/12/2021.
//

import Foundation

protocol DIContainerProtocol {
    func createAPIClient() -> APIClient
    func createParser() -> ObjectParser
    func createWeatherServices() -> WeatherServices
}


final class DIContainer: DIContainerProtocol {
  static let shared = DIContainer()

  private init() {}

    func createAPIClient() -> APIClient {
        let apiClient = APIClient(baseUrl: Constants.baseUrl)
        return apiClient
    }
    func createParser() -> ObjectParser {
        let objectParser = ObjectParser()
        return objectParser
    }
    func createWeatherServices() -> WeatherServices {
        let weatherServices = WeatherServices(client: createAPIClient(), parser: createParser())
        return weatherServices
    }
    
}
