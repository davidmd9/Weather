//
//  WeatherModel.swift
//  Weather
//
//  Created by David Minasyan on 14/02/2019.
//  Copyright © 2019 David Minasyan. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        cod             <- map["cod"]
        message         <- map["message"]
        cnt             <- map["cnt"]
        list            <- map["list"]
        city            <- map["city"]
    }
    
    var cod: String?
    var message: Double?
    var cnt: Int?
    var list: [List]?
    var city: City?
    
    init(cod: String?, message: Double?, cnt: Int?, list: [List]?, city: City?) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
}

class City: Mappable {
    required init?(map: Map) {
        mapping(map:map)
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        coord               <- map["coord"]
        country             <- map["country"]
        population          <- map["population"]
    }
    
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    
    init(id: Int?, name: String?, coord: Coord?, country: String?, population: Int?) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
    }
}

class Coord: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        lat             <- map["lat"]
        lon             <- map["lon"]
    }
    
    var lat, lon: Double?
    
    init(lat: Double?, lon: Double?) {
        self.lat = lat
        self.lon = lon
    }
}

class List: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        dt              <- map["dt"]
        main            <- map["main"]
        weather         <- map["weather"]
        clouds          <- map["clouds"]
        wind            <- map["wind"]
        snow            <- map["snow"]
        sys             <- map["sys"]
        dtTxt           <- map["dt_txt"]
        rain            <- map["rain"]
    
    }
    
    var dt: Int?
    var main: MainClass?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
    var snow: Rain?
    var sys: Sys?
    var dtTxt: String?
    var rain: Rain?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, snow, sys
        case dtTxt = "dt_txt"
        case rain
    }
    
    init(dt: Int?, main: MainClass?, weather: [Weather]?, clouds: Clouds?, wind: Wind?, snow: Rain?, sys: Sys?, dtTxt: String?, rain: Rain?) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.snow = snow
        self.sys = sys
        self.dtTxt = dtTxt
        self.rain = rain
    }
}

class Clouds: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        all            <- map["all"]
    }
    
    var all: Int?
    
    init(all: Int?) {
        self.all = all
    }
}

class MainClass: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        temp                <- map["temp"]
        tempMin             <- map["tempMin"]
        tempMax             <- map["tempMax"]
        pressure            <- map["pressure"]
        seaLevel            <- map["seaLevel"]
        grndLevel           <- map["grndLevel"]
        humidity            <- map["humidity"]
        tempKf              <- map["tempKf"]
    }
    
    var temp, tempMin, tempMax, pressure: Double?
    var seaLevel, grndLevel: Double?
    var humidity: Int?
    var tempKf: Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
    
    init(temp: Double?, tempMin: Double?, tempMax: Double?, pressure: Double?, seaLevel: Double?, grndLevel: Double?, humidity: Int?, tempKf: Double?) {
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.tempKf = tempKf
    }
}

class Rain: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        the3H                <- map["3h"]
    }
    
    var the3H: Double?
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
    
    init(the3H: Double?) {
        self.the3H = the3H
    }
}

class Sys: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        pod                <- map["pod"]
    }
    
    var pod: Pod?
    
    init(pod: Pod?) {
        self.pod = pod
    }
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

class Weather: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id                  <- map["id"]
        main                <- map["main"]
        description         <- map["description"]
        icon                <- map["icon"]
    }
    
    var id: Int?
    var main: MainEnum?
    var description: Description?
    var icon: String?
    
    init(id: Int?, main: MainEnum?, description: Description?, icon: String?) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case lightSnow = "light snow"
    case scatteredClouds = "scattered clouds"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
    case snow = "Snow"
}

class Wind: Mappable {
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        speed        <- map["speed"]
        deg          <- map["deg"]
    }
    
    var speed, deg: Double?
    
    init(speed: Double?, deg: Double?) {
        self.speed = speed
        self.deg = deg
    }
}
