//
//  Data.swift
//  Weather
//
//  Created by Гидаят Джанаева on 20.02.2024.
//

import Foundation

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Codable {
    var temp: Double = 0.0
    var humidity: Int = 0
    var pressure: Int = 0
    var feels_like: Double = 0.0

}

extension Main {
    var tempInt: Int {
        return Int(round(temp))
    }
    
    var feelsLikeInt: Int {
        return Int(round(feels_like))
    }
}

struct Wind: Codable {
    var speed: Double = 0.0
}

struct WeatherData: Codable {
    var weather: [Weather] = []
    var main: Main = Main()
    var wind: Wind = Wind()
    var name: String = ""
    
}


