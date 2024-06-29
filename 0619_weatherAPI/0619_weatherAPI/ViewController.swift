//
//  ViewController.swift
//  0619_weatherAPI
//
//  Created by 김성률 on 6/19/24.
//

import UIKit
import SnapKit
import CoreLocation
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    let dateLabel = UILabel()
    let locationImage = UIImageView()
    let uploadImage = UIImageView()
    let refreshButton = UIButton()
    
    let locationLabel = UILabel()
    
    let temperatureLabel = UILabel()
    let wetLabel = UILabel()
    let windLabel = UILabel()
    let weatherImage = UIImageView()
    let commentLabel = UILabel()
    
    let locationManager = CLLocationManager()
    var latitude: Double = 0
    var longitude: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        refreshButton.addTarget(self, action: #selector(refreshButtonClicked), for: .touchUpInside)
        
    }

    func configureHierarchy() {
        
        view.addSubview(dateLabel)
        view.addSubview(locationImage)
        view.addSubview(locationLabel)
        view.addSubview(uploadImage)
        view.addSubview(refreshButton)
        view.addSubview(temperatureLabel)
        view.addSubview(wetLabel)
        view.addSubview(windLabel)
        view.addSubview(weatherImage)
        view.addSubview(commentLabel)
        
    }
    
    func configureLayout() {
        
        view.backgroundColor = .orange
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(20)
        }
        
        locationImage.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.height.width.equalTo(30)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.leading.equalTo(locationImage.snp.trailing).offset(16)
            make.height.equalTo(30)
        }
        
        refreshButton.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
       
        uploadImage.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.trailing.equalTo(refreshButton.snp.leading).offset(-24)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.height.equalTo(42)
            make.width.equalTo(160)
        }
        
        wetLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.height.equalTo(42)
            make.width.equalTo(130)
        }
        
        windLabel.snp.makeConstraints { make in
            make.top.equalTo(wetLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.height.equalTo(42)
            make.width.equalTo(180)
        }
        
        weatherImage.snp.makeConstraints { make in
            make.top.equalTo(windLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.height.equalTo(120)
            make.width.equalTo(200)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImage.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.height.equalTo(42)
            make.width.equalTo(200)
        }
        
    }
    
    func configureUI() {
        
        locationLabel.textColor = .white
        
        locationImage.image = UIImage(systemName: "location.fill")
        locationImage.tintColor = .white
        
        uploadImage.image = UIImage(systemName: "square.and.arrow.up")
        uploadImage.tintColor = .white
        
        refreshButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        refreshButton.tintColor = .white
        
        commentLabel.text = "오늘도 행복한 하루 보내세요"
        
        let labelArray = [temperatureLabel, wetLabel, windLabel, commentLabel]
        
        for item in labelArray {
            labelDesign(label: item)
        }
        
    }
    
    func labelDesign(label: UILabel) {
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.backgroundColor = .white
        label.textAlignment = .center
        
    }
    
    func callRequest(lat: Double, long: Double) {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?units=metric&lat=\(lat)&lon=\(long)&appid="
        
        AF.request(url).responseDecodable(of: Total.self) { response in
            switch response.result {
            case .success(let value):
                
                print(value)
                
                self.dateLabel.text = self.getCurrentDateTimeFormatted()
                self.locationLabel.text = "서울 \(value.name)"
                self.temperatureLabel.text = "지금은 \(value.main.temp)도 에요"
                self.wetLabel.text = "\(value.main.humidity)% 만큼 습해요"
                self.windLabel.text = "\(value.wind.speed)m/s의 바람이 불어요"
                
                let url = URL(string: "https://openweathermap.org/img/wn/\(value.weather[0].icon)@2x.png")
                self.weatherImage.kf.setImage(with: url)

            case .failure(let error):
                print("실패")
            }
        }
        
    }
    
    func getCurrentDateTimeFormatted() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MM월 dd일 HH시 mm분"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter.string(from: date)
    }
    
    @objc func refreshButtonClicked() {
        
        locationManager.startUpdatingLocation()
        
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
        
        APIRequest.shared.callRequest(lat: latitude, long: longitude) { value, error in
            print(value)
            guard let value = value else { return }
            
            self.dateLabel.text = self.getCurrentDateTimeFormatted()
            self.locationLabel.text = "서울 \(value.name)"
            self.temperatureLabel.text = "지금은 \(value.main.temp)도 에요"
            self.wetLabel.text = "\(value.main.humidity)% 만큼 습해요"
            self.windLabel.text = "\(value.wind.speed)m/s의 바람이 불어요"
            
            let url = URL(string: "https://openweathermap.org/img/wn/\(value.weather[0].icon)@2x.png")
            self.weatherImage.kf.setImage(with: url)
        }
        
//        callRequest(lat: latitude, long: longitude)
        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
}
