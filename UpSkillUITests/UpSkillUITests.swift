//
//  UpSkillUITests.swift
//  UpSkillUITests
//
//  Created by TCode on 24/12/2020.
//

import XCTest

class UpSkillUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // present dashboard
        snapshot("Dashboard")

        // 5 Go to a list with all the areas
        snapshot("iOS Tech Areas")

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
