//
//  ForecastCellViewModel.swift
//  Weather
//
//  Created by Zuhair Hussain on 14/12/2021.
//

import Foundation

protocol ForecastCellViewModelType {
    var iconUrl: String? { get }
    var minTemperature: String? { get }
    var maxTemperature: String? { get }
}


class ForecastCellViewModel: ForecastCellViewModelType {
    var iconUrl: String?
    var minTemperature: String?
    var maxTemperature: String?
    
    init(data: WeatherForcastReport?) {
        iconUrl = "\(Constants.imageBaseUrl)\(data?.weather?.first?.icon ?? "").png"
        
        if let max = data?.temp?.max, let min = data?.temp?.min {
            minTemperature = "\(Int(min) - 275)°"
            maxTemperature = "\(Int(max) - 275)°"
        } else {
            minTemperature = "--"
            maxTemperature = "--"
        }
        
    }
    
    
}
