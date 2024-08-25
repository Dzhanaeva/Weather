//
//  ViewController.swift
//  Weather
//
//  Created by Гидаят Джанаева on 20.02.2024.
//

import UIKit
import CoreLocation

class WeatherView: UIViewController {
    
    var searchBar = UISearchBar()
    var viewSearch = UIView()
    
    private let locationManager = LocationManager()
    private let build = Build.shared
    var weatherData = WeatherData()
    
    private let searchController = UISearchController()
    
    private var nameCity = UILabel()
    private var weatherDescription = UILabel()
    private var temp = UILabel()
    private var humidity = UILabel()
    private var wind = UILabel()
    private var feelsLike = UILabel()
    private var weatherIcon = UIImageView()
    private var humidityText = UILabel()
    private var windText = UILabel()
    private var feelsLikeText = UILabel()
    private var humidityIcon = UIImageView()
    private var windIcon = UIImageView()
    private var feelsLikeIcon = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 244/255, green: 245/255, blue: 238/255, alpha: 1.0)
        
        setupViews()
        view.addSubviews(nameCity, weatherIcon, temp, weatherDescription, humidity, humidityText, humidityIcon, wind, windText, windIcon, feelsLike, feelsLikeText, feelsLikeIcon)
        setupLocationManager()
        setupConstraints()

    }
    

    func updateView() {
        nameCity.text = weatherData.name
        weatherDescription.text = DataSource.weatherIDs[weatherData.weather[0].id]
        temp.text = weatherData.main.tempInt.description + "°с"
        weatherIcon.image = UIImage(named: weatherData.weather[0].icon)
        humidity.text = weatherData.main.humidity.description + "%"
        wind.text = weatherData.wind.speed.description + "m/s"
        feelsLike.text = weatherData.main.feelsLikeInt.description + "°с"
    }

    
    func updateWeatherInfo(latitude: Double, longtitude: Double) {
        let session = URLSession.shared
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&appid=cfd812be276893fb715a2c68fc595d63&lang=ru&units=metric")!
        
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                print(self.weatherData)
                DispatchQueue.main.async {
                    self.updateView()
                }
            } catch {
                print(error.localizedDescription)
                
            }
        }
        
        task.resume()
    }
    
    func setupLocationManager() {
        locationManager.onLocationUpdate = { [weak self] location in
            self?.updateWeatherInfo(latitude: location.coordinate.latitude, longtitude: location.coordinate.longitude)
        }
        locationManager.checkLocationAuthorization()
    }
    
    func setupViews() {
        nameCity = build.nameCity
        weatherIcon = build.weatherIcon
        temp = build.temp
        weatherDescription = build.weatherDescription
        
        humidity = build.humidityLabel
        humidityText = build.humidityText
        humidityText.text = "влажность"
        humidityIcon = build.humidityIcon
        humidityIcon.image = UIImage(named: "humidity4")
        
        wind = build.windLabel
        windText = build.windText
        windText.text = "ветер"
        windIcon = build.windIcon
        windIcon.image = UIImage(named: "wind3")
        
        feelsLike = build.feelsLikeLabel
        feelsLikeText = build.feelsLikeText
        feelsLikeText.text = "ощущается как"
        feelsLikeIcon = build.feelsLikeIcon
        feelsLikeIcon.image = UIImage(named: "feelsLike2")
    }
    
   private func setupConstraints() {

       
       NSLayoutConstraint.activate([
        
           nameCity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           nameCity.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
           
           weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           weatherIcon.topAnchor.constraint(equalTo: nameCity.bottomAnchor, constant: 50),
           
           temp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           temp.bottomAnchor.constraint(equalTo: weatherDescription.topAnchor, constant: -10),
           
           weatherDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           weatherDescription.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -220),
           
           humidity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
           humidity.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
           
           humidityText.bottomAnchor.constraint(equalTo: humidity.topAnchor, constant: 2),
           humidityText.centerXAnchor.constraint(equalTo: humidity.centerXAnchor),
           
           humidityIcon.bottomAnchor.constraint(equalTo: humidityText.topAnchor, constant: -3),
           humidityIcon.centerXAnchor.constraint(equalTo: humidityText.centerXAnchor),
           
           wind.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           wind.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
           
           windText.bottomAnchor.constraint(equalTo: wind.topAnchor, constant: 2),
           windText.centerXAnchor.constraint(equalTo: wind.centerXAnchor),
           
           windIcon.bottomAnchor.constraint(equalTo: windText.topAnchor, constant: 2),
           windIcon.centerXAnchor.constraint(equalTo: windText.centerXAnchor),
           
           feelsLike.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
           feelsLike.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
           
           feelsLikeText.bottomAnchor.constraint(equalTo: feelsLike.topAnchor, constant: 2),
           feelsLikeText.centerXAnchor.constraint(equalTo: feelsLike.centerXAnchor),
           
           feelsLikeIcon.bottomAnchor.constraint(equalTo: feelsLikeText.topAnchor, constant: -3),
           feelsLikeIcon.centerXAnchor.constraint(equalTo: feelsLikeText.centerXAnchor)
       ])
    }
    
}
    
extension WeatherView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}
