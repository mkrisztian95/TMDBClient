//
//  Logger.swift
//  charpic
//
//  Created by Chris on 26.04.2021.
//

import UIKit

class Logger: NSObject {
    static func logError(err: Error) {
        print("ππππππππππ")
        print(err.localizedDescription)
        print("ππππππππππ")
    }

    static func logString(value: String) {
        print("ββββββββββ")
        print(value)
        print("ββββββββββ")
    }

    static func logError(err: NSError) {
        print("ππππππππππ")
        print("\(err.code) - " + err.localizedDescription)
        print("ππππππππππ")
    }

    static func logSuccess(string: String) {
        print("πΎπΎπΎπΎπΎπΎπΎπΎπΎπΎ")
        print(string)
        print("πΎπΎπΎπΎπΎπΎπΎπΎπΎπΎ")
    }
}
