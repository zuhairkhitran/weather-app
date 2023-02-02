//
//  ArrayExtnsTests.swift
//  WeatherTests
//
//  Created by Zuhair Hussain on 13/12/2021.
//

import XCTest
@testable import Weather


class ArrayExtnsTests: XCTestCase {
    
    func test_objectAt_not_nil() {
        let array = [1, 2, 3, 4]
        let object = array.object(at: 3)
        XCTAssertNotNil(object)
    }
    
    func test_objectAt_nil() {
        let array = [1, 2, 3, 4]
        let object = array.object(at: 4)
        XCTAssertNil(object)
    }
    func test_objectAt_value() {
        let array = [1, 2, 3, 4]
        let object = array.object(at: 3)
        XCTAssertEqual(object, 4)
    }
    
}
