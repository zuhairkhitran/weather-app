//
//  ArrayExtns.swift
//  Weather
//
//  Created by Zuhair Hussain on 13/12/2021.
//

import Foundation


extension Array {
    func object(at index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}
