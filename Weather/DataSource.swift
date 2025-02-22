//
//  DataSource.swift
//  Weather
//
//  Created by Гидаят Джанаева on 21.02.2024.
//

import Foundation

struct DataSource {
    static let weatherIDs: [Int: String] = [
        200: "гроза с небольшим дождем",
        201: "гроза с дождем",
        202: "гроза с сильным дождем",
        210: "небольшая гроза",
        211: "гроза",
        212: "сильная гроза",
        221: "сильнейшая гроза",
        230: "гроза с небольшим дождем",
        231: "гроза с дождем",
        232: "гроза с сильным дождем",
        300: "легкий моросящий дождь",
        301: "мелкий дождь",
        302: "сильный моросящий дождь",
        310: "интенсивный моросящий дождь",
        311: "моросящий дождь",
        312: "сильный моросящий дождь",
        313: "ливень и изморось",
        314: "сильный ливень и изморось",
        321: "ливневый дождь",
        500: "небольшой дождь",
        501: "умеренный дождь",
        502: "сильный интенсивный дождь",
        503: "очень сильный дождь",
        504: "экстремальный дождь",
        511: "ледянной дождь",
        520: "непродолжительный ливень",
        521: "проливной дождь",
        522: "продолжительный ливень",
        531: "сильнейший ливень",
        600: "небольшой снег",
        601: "снег",
        602: "сильный снег",
        611: "мокрый снег",
        612: "дождь со снегом",
        615: "небольшой дождь и снег",
        616: "дождь и снег",
        620: "небольшой снегопад",
        621: "снегопад",
        622: "сильный снегопад",
        701: "пасмурность",
        711: "дым",
        721: "дымка",
        731: "песок, пылевые вихри",
        741: "туман",
        751: "песок",
        761: "пыль",
        762: "вулканический пепел",
        771: "шквал",
        781: "торнадо",
        800: "чистое небо",
        801: "немного облачно",
        802: "рассеянные облака",
        803: "рванные облака",
        804: "пасмурные облака"
    ]
}
