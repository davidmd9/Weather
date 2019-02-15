//
//  WeatherService.swift
//  Weather
//
//  Created by David Minasyan on 14/02/2019.
//  Copyright © 2019 David Minasyan. All rights reserved.
//

import Foundation
import Moya_ObjectMapper
import Moya

enum WeatherService {
    case getWeather(city: String, countryCode: String, appid: String)
}

extension WeatherService : TargetType {
    var baseURL: URL {
        return URL(string: "http://api.openweathermap.org/data/2.5/forecast")!
    }
    
    var path: String {
        return "/"
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeather(_, _, _):
            return .get
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .getWeather(let city, let countryCode, let appid):
            return .requestParameters(parameters: ["q": city+","+countryCode, "mode": "json", "appid": appid], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    

}
