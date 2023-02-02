//
//  WeatherServices.swift
//  Weather
//
//  Created by Zuhair Hussain on 09/12/2021.
//

import RxSwift


protocol Services {
    func getTodayWeatherData(forCity: String) -> Observable<WeatherData>
    func getWeatherForecastData(forCity city: String, days: Int) -> Observable<WeatherForecastData>
}

class WeatherServices: Services {
    
    var client: Client
    var parser: Parser
    
    var disposeBag = DisposeBag()
    
    var weatherHeader: [String: String] = [
        "x-rapidapi-key": Constants.weatherApiKey,
        "x-rapidapi-host": Constants.host
    ]
    
    init(client: Client, parser: Parser) {
        self.client = client
        self.parser = parser
    }
    
    func getTodayWeatherData(forCity city: String) -> Observable<WeatherData> {
        return client.fetchData(route: Routes.weather, header: weatherHeader, parameters: ["q": city])
            .flatMap { self.parser.parse(data: $0, toType: WeatherData.self) }
    }
    
    func getWeatherForecastData(forCity city: String, days: Int) -> Observable<WeatherForecastData> {
        return client.fetchData(route: Routes.forecast, header: self.weatherHeader, parameters: ["q": city, "cnt": "\(days)"])
            .flatMap { self.parser.parse(data: $0, toType: WeatherForecastData.self) }
    }
    
    
}
