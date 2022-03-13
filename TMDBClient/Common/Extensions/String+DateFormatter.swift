//
//  String+DateFormatter.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation

extension String {

    func getDate() -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: self)
    }
}
