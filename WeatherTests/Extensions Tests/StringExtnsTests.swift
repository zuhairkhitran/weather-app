//
//  StringExtnsTests.swift
//  WeatherTests
//
//  Created by Zuhair Hussain on 13/12/2021.
//

import XCTest
@testable import Weather


class StringExtnsTests: XCTestCase {
    
    func test_trimmed_spaces() {
        let string = " test string "
        let trimmed = string.trimmed
        let expectedResult = "test string"
        XCTAssertEqual(trimmed, expectedResult)
    }
    func test_trimmed_newline() {
        let string = " test string \n "
        let trimmed = string.trimmed
        let expectedResult = "test string"
        XCTAssertEqual(trimmed, expectedResult)
    }
    func test_string_value_function() {
        let dateString = "22-02-2013T14:30:00"
        let date = dateString.dateValue(format: "dd-MM-yyyy'T'HH:mm:ss")
        let results = date?.stringValue(format: "dd-MM-yyyy'T'HH:mm:ss")
        XCTAssertEqual(dateString, results)
    }
    func test_to_date() {
        
//        let dates = ["13-12-2021T18:02:02", "2021-12-13T18:02:02.1980", "2021-12-13T18:02:02.199Z", "2021-12-13T18:02:02+0000"]
//
        let formats = ["dd-MM-yyyy'T'HH:mm:ss", "yyyy-MM-dd'T'HH:mm:ss.SSSS", "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd'T'HH:mm:ss", "dd MMM yyyy", "MM-dd-yyyy"]
        for format in formats {
            let date = Date()
            let dateString = date.stringValue(format: format)
            XCTAssertNotNil(dateString)
        }
        
        
    }
    
    func test_to_date_with_zero_prefix() {
        
        let dateString = "0000-01-01T14:30:00"
        let date = dateString.toDate
        XCTAssertNotNil(date)
    }
    
}
