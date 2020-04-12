//
//  Results.swift
//  Cornoa Charts
//
//  Created by Roy Akash on 12/04/20.
//  Copyright © 2020 theroyakash. All rights reserved.
//

import Foundation

// MARK: - Results
struct Results: Codable {
    let cases_time_series: [CasesTimeSeries]
    let statewise: [Statewise]
    let tested: [Tested]
    
}

// MARK: - CasesTimeSery
struct CasesTimeSeries: Codable {
    let dailyconfirmed, dailydeceased, dailyrecovered, date: String
    let totalconfirmed, totaldeceased, totalrecovered: String
}

// MARK: - Statewise
struct Statewise: Codable {
    let active, confirmed, deaths, deltaconfirmed: String
    let deltadeaths, deltarecovered, lastupdatedtime, recovered: String
    let state, statecode: String
}

// MARK: - Tested
struct Tested: Codable {
    let positivecasesfromsamplesreported, samplereportedtoday: String
    let source: String
    let testsconductedbyprivatelabs, totalindividualstested, totalpositivecases, totalsamplestested: String
    let updatetimestamp: String
}
