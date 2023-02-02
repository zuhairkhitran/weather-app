//
//  HomeViewModel.swift
//  Weather
//
//  Created by Zuhair Hussain on 09/12/2021.
//

import RxSwift
import RxSwiftExt


protocol HomeViewModelInput {
    func loadData()
}
protocol HomeViewModelOutput {
    var forecaseDays: Int { get }
    var todayWeatherViewModel: Observable<TodayWeatherCellViewModelType> { get }
    var forecastWeatherViewModel: Observable<[ForecastCellViewModelType]> { get }
    var showError: Observable<String> { get }
}

protocol HomeViewModelType {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

class HomeViewModel: HomeViewModelType, HomeViewModelOutput, HomeViewModelInput {
    
    
    // MARK: - Type
    var input: HomeViewModelInput { self }
    var output: HomeViewModelOutput { self }
    
    // MARK: - Input
    func loadData() {
        getTodayWeather()
        getWeatherForecast()
    }
    
    // MARK: - Output
    var forecaseDays: Int { return weatherForecaseDays }
    var showError: Observable<String> { showErrorSubject.asObserver() }
    var todayWeatherViewModel: Observable<TodayWeatherCellViewModelType> { todayWeatherViewModelSubject.asObserver() }
    var forecastWeatherViewModel: Observable<[ForecastCellViewModelType]> { forcastWeatherViewModelSubject.asObserver() }
    
    // MARK: - Private Properties
    private let disposeBag = DisposeBag()
    private var weatherForecaseDays = 7
    private var showErrorSubject = PublishSubject<String>()
    private var todayWeatherViewModelSubject = PublishSubject<TodayWeatherCellViewModelType>()
    private var forcastWeatherViewModelSubject = PublishSubject<[ForecastCellViewModelType]>()
    private var services: Services
    
    
    // MARK: - Initializer
    init(services: Services) {
        self.services = services
    }
    
    
    // MARK: - Private Functions
    private func getTodayWeather() {
        let results = self.services.getTodayWeatherData(forCity: Constants.cityName)
        results.map({ TodayWeatherCellViewModel(data: $0) })
            .subscribe(
                onNext: { [weak self] in self?.todayWeatherViewModelSubject.onNext($0) },
                onError: { [weak self] in self?.showErrorSubject.onNext($0.localizedDescription) })
            .disposed(by: disposeBag)
    }
    
    private func getWeatherForecast() {
        
        let results = self.services.getWeatherForecastData(forCity: Constants.cityName, days: weatherForecaseDays)
        results
            .map({ $0.list.map { ForecastCellViewModel(data: $0) } })
            .subscribe(
                onNext: { [weak self] in self?.forcastWeatherViewModelSubject.onNext($0) },
                onError: { [weak self] in self?.showErrorSubject.onNext($0.localizedDescription) })
            .disposed(by: disposeBag)
        
    }
    
}
