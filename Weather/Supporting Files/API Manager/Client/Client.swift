//
//  Client.swift
//  Weather
//
//  Created by Zuhair Hussain on 10/12/2021.
//

import RxSwift

protocol Client {
    func fetchData(route: Routes, header: [String: String], parameters: [String: Any]) -> Observable<Data>
}
